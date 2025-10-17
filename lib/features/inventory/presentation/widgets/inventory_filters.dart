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
  final List<String> _filters = const [
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          final filter = _filters[index];
          final bool isSelected = _selected == filter;

          return GestureDetector(
            onTap: () => _onFilterTap(filter),
            child: FBadge(
              style: isSelected
                  ? FBadgeStyle.primary()
                  : FBadgeStyle.secondary(),
              child: Text(filter, style: const TextStyle(fontSize: 14)),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: _filters.length,
      ),
    );
  }
}
