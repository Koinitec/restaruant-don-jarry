import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/features/users/presentation/widgets/users_empty_state.dart';
import 'package:restaruant_don_jarry/features/users/presentation/widgets/users_filters.dart';
import 'package:restaruant_don_jarry/features/users/presentation/widgets/users_header.dart';
import 'package:restaruant_don_jarry/features/users/presentation/widgets/users_summary_cards.dart';
import 'package:restaruant_don_jarry/features/users/presentation/widgets/users_search_bar.dart';
import 'package:restaruant_don_jarry/features/users/presentation/widgets/users_card.dart';
import 'package:restaruant_don_jarry/shared/widgets/pagination/pagination_widget.dart';
import 'package:restaruant_don_jarry/shared/widgets/modal/dialog_modal_widget.dart';

class UsersScreens extends StatefulWidget {
  const UsersScreens({super.key});

  @override
  State<UsersScreens> createState() => _UsersScreensState();
}

class _UsersScreensState extends State<UsersScreens> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final List<Map<String, dynamic>> _users = [];
  int _currentPage = 1;
  final int _itemsPerPage = 6;

  Color get primaryColor => Colors.blue;
  Color get warningColor => Colors.orange;
  Color get dangerColor => Colors.redAccent;

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
            final iconSize = (width / 35).clamp(22, 32).toDouble();

            return SingleChildScrollView(
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const UsersHeader(),
                        const SizedBox(height: 20),
                        UsersSummaryCards(users: _users),
                        const SizedBox(height: 28),
                        _buildSearchAndAddButton(context),
                        const SizedBox(height: 16),
                        const UsersFilters(),
                        const SizedBox(height: 24),
                        Text(
                          'Usuarios',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 12),
                        _users.isEmpty
                            ? const UsersEmptyState()
                            : Column(
                                children: [
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 360,
                                          crossAxisSpacing: 16,
                                          mainAxisSpacing: 16,
                                          childAspectRatio: 2.2,
                                        ),
                                    itemCount: _paginatedUsers(iconSize).length,
                                    itemBuilder: (_, i) =>
                                        _paginatedUsers(iconSize)[i],
                                  ),
                                  const SizedBox(height: 16),
                                  _buildPagination(),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // --------------------
  // Search Bar + Add Button
  // --------------------
  Widget _buildSearchAndAddButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: UsersSearchBar(
            controller: _searchController,
            onChanged: (_) => setState(() {}),
          ),
        ),
        const SizedBox(width: 12),
        _buildAddUserModal(context),
      ],
    );
  }

  // --------------------
  // Modal: Agregar usuario
  // --------------------
  DialogModalWidget _buildAddUserModal(BuildContext context) {
    return DialogModalWidget(
      title: 'Agregar usuario',
      buttonLabel: 'Agregar',
      fields: [_buildUserForm()],
      actions: [_buildCancelButton(), _buildSaveButton(add: true)],
    );
  }

  // --------------------
  // Formulario compartido
  // --------------------
  Widget _buildUserForm() {
    return Material(
      color: Colors.transparent,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField(_nameController, 'Nombre del usuario'),
            const SizedBox(height: 12),
            _buildTextField(
              _priceController,
              'Precio',
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }

  TextField _buildTextField(
    TextEditingController controller,
    String label, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  // --------------------
  // Botones de Modal
  // --------------------
  FButton _buildCancelButton() {
    return FButton(
      style: FButtonStyle.outline(),
      onPress: () => Navigator.of(context).pop(),
      child: const Text('Cancelar'),
    );
  }

  FButton _buildSaveButton({required bool add, int? index}) {
    return FButton(
      onPress: () {
        if (_formKey.currentState!.validate()) {
          setState(() {
            final user = {
              'name': _nameController.text,
              'price': _priceController.text,
              'role': 'Empleado', // default role
            };
            if (add) {
              _users.add(user);
            } else {
              _users[index!] = user;
            }

            _nameController.clear();
            _priceController.clear();
          });
          Navigator.of(context).pop();
        }
      },
      child: Text(add ? 'Guardar' : 'Actualizar'),
    );
  }

  // --------------------
  // Paginación de usuarios
  // --------------------
  List<Widget> _paginatedUsers(double iconSize) {
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = (start + _itemsPerPage).clamp(0, _users.length);
    final pageItems = _users.sublist(start, end);

    return pageItems.asMap().entries.map((entry) {
      final index = start + entry.key;
      final user = entry.value;

      return UsersCard(
        user: user,
        index: index,
        iconSize: iconSize,
        onEdit: () => _showEditUser(index),
        onDelete: () => setState(() => _users.removeAt(index)),
      );
    }).toList();
  }

  // --------------------
  // Widget de paginación
  // --------------------
  Widget _buildPagination() {
    final totalPages = (_users.length / _itemsPerPage).ceil();
    return totalPages > 1
        ? PaginationWidget(
            pages: totalPages,
            initialPage: _currentPage,
            onPageChanged: (page) => setState(() => _currentPage = page),
          )
        : const SizedBox.shrink();
  }

  // --------------------
  // Editar usuario
  // --------------------
  void _showEditUser(int index) {
    final user = _users[index];
    _nameController.text = user['name'];
    _priceController.text = user['price'];

    showFDialog(
      context: context,
      barrierLabel: 'Editar usuario',
      builder: (context, style, animation) => FDialog(
        title: const Text('Editar usuario'),
        body: _buildUserForm(),
        actions: [
          _buildCancelButton(),
          _buildSaveButton(add: false, index: index),
        ],
      ),
    );
  }
}
