import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class InventoryFilters extends StatefulWidget {
  final ValueChanged<String>? onFilterSelected;

  final String? selectedFilter;

  const InventoryFilters({
    super.key,
    this.onFilterSelected,
    this.selectedFilter,
  });

  @override
  State<InventoryFilters> createState() => _InventoryFiltersState();
}

class _InventoryFiltersState extends State<InventoryFilters> {
  static const double _filterHeight = 40.0;
  static const double _horizontalPadding = 8.0;
  static const double _filterSpacing = 8.0;
  static const double _fontSize = 14.0;

  static const List<String> _filters = [
    'Platos Fuertes',
    'Bebidas',
    'Postres',
    'Stock Bajo',
    'Agotados',
    'Nuevos',
    'Ofertas',
    'Especiales',
  ];

  String? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedFilter;
  }

  void _onFilterTap(String filter) {
    setState(() => _selected = filter);
    widget.onFilterSelected?.call(filter);
  }

  Widget _buildFilterBadge(String filter) {
    final bool isSelected = _selected == filter;

    return GestureDetector(
      onTap: () => _onFilterTap(filter),
      child: FBadge(
        style: isSelected ? FBadgeStyle.primary() : FBadgeStyle.secondary(),
        child: Text(filter, style: const TextStyle(fontSize: _fontSize)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _filterHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
        itemCount: _filters.length,
        itemBuilder: (context, index) => _buildFilterBadge(_filters[index]),
        separatorBuilder: (_, _) => const SizedBox(width: _filterSpacing),
      ),
    );
  }
}
