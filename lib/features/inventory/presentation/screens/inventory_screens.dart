import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/widgets/pagination/pagination_widget.dart';
import 'package:restaruant_don_jarry/shared/widgets/modal/dialog_modal_widget.dart';
import '../widgets/inventory_header.dart';
import '../widgets/inventory_summary_cards.dart';
import '../widgets/inventory_search_bar.dart';
import '../widgets/inventory_filters.dart';
import '../widgets/inventory_product_card.dart';
import '../widgets/inventory_empty_state.dart';

class InventoryScreens extends StatefulWidget {
  const InventoryScreens({super.key});

  @override
  State<InventoryScreens> createState() => _InventoryScreensState();
}

class _InventoryScreensState extends State<InventoryScreens> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _userProducts = [];

  int _currentPage = 1;
  final int _itemsPerPage = 6;

  // Controladores del formulario modal
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  // Colores personalizados tipo KFC 🍗
  Color get primaryColor => const Color(0xFFd35400);
  Color get warningColor => const Color(0xFFf39c12);
  Color get dangerColor => Colors.redAccent;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _searchController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final double iconSize = (width / 35).clamp(22, 32);
            int crossAxisCountProducts = width < 600
                ? 1
                : width < 900
                ? 2
                : 3;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InventoryHeader(),
                  const SizedBox(height: 20),
                  InventorySummaryCards(products: _userProducts),
                  const SizedBox(height: 28),

                  /// 🔍 Búsqueda y botón agregar producto
                  Row(
                    children: [
                      Expanded(
                        child: InventorySearchBar(
                          controller: _searchController,
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      const SizedBox(width: 12),
                      _buildAddProductModal(context),
                    ],
                  ),

                  const SizedBox(height: 16),
                  const InventoryFilters(),
                  const SizedBox(height: 24),

                  ///  Lista de productos
                  Text(
                    'Productos',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),

                  if (_userProducts.isEmpty)
                    const InventoryEmptyState()
                  else
                    Column(
                      children: [
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: crossAxisCountProducts,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 2.2,
                          children: _paginatedProducts(iconSize),
                        ),
                        const SizedBox(height: 16),
                        _buildPagination(),
                      ],
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  ///  Modal dinámico reutilizable (Agregar producto)
  DialogModalWidget _buildAddProductModal(BuildContext context) {
    return DialogModalWidget(
      title: 'Agregar producto',
      buttonLabel: 'Agregar',
      fields: [
        // 🧱 Agregamos un Material aquí
        Material(
          color: Colors.transparent,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Nombre del producto',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Precio',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      actions: [
        FButton(
          style: FButtonStyle.outline(),
          onPress: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        FButton(
          onPress: () {
            if (_formKey.currentState!.validate()) {
              setState(() {
                _userProducts.add({
                  'name': _nameController.text,
                  'price': _priceController.text,
                });
                _nameController.clear();
                _priceController.clear();
              });
              Navigator.of(context).pop();
            }
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }

  ///  Paginación de productos
  List<Widget> _paginatedProducts(double iconSize) {
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = start + _itemsPerPage;
    final pageItems = _userProducts.sublist(
      start,
      end > _userProducts.length ? _userProducts.length : end,
    );

    return pageItems.asMap().entries.map((entry) {
      final index = start + entry.key;
      final product = entry.value;

      return InventoryProductCard(
        product: product,
        index: index,
        iconSize: iconSize,
        onEdit: () => _editProduct(product, index),
        onDelete: () => setState(() => _userProducts.removeAt(index)),
      );
    }).toList();
  }

  ///  Widget reutilizable de paginación
  Widget _buildPagination() {
    final totalPages = (_userProducts.length / _itemsPerPage).ceil();
    if (totalPages <= 1) return const SizedBox.shrink();

    return PaginationWidget(
      pages: totalPages,
      initialPage: _currentPage,
      onPageChanged: (page) {
        setState(() => _currentPage = page);
      },
    );
  }

  /// Modal para editar producto
  void _editProduct(Map<String, dynamic> product, int index) {
    _nameController.text = product['name'];
    _priceController.text = product['price'];

    showFDialog(
      context: context,
      barrierLabel: 'Editar producto',
      builder: (context, style, animation) => FDialog(
        title: const Text('Editar producto'),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _nameController),
            const SizedBox(height: 12),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          FButton(
            style: FButtonStyle.outline(),
            onPress: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          FButton(
            onPress: () {
              setState(() {
                _userProducts[index] = {
                  'name': _nameController.text,
                  'price': _priceController.text,
                };
                _nameController.clear();
                _priceController.clear();
              });
              Navigator.of(context).pop();
            },
            child: const Text('Actualizar'),
          ),
        ],
      ),
    );
  }
}
