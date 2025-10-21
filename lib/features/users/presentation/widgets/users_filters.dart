import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class UsersFilters extends StatefulWidget {
  final ValueChanged<String>? onFilterSelected;

  final String? selectedFilter;

  const UsersFilters({super.key, this.onFilterSelected, this.selectedFilter});

  @override
  State<UsersFilters> createState() => _UsersFiltersState();
}

class _UsersFiltersState extends State<UsersFilters> {
  static const double _filterHeight = 40.0;
  static const double _horizontalPadding = 8.0;
  static const double _filterSpacing = 8.0;
  static const double _fontSize = 14.0;

  static const List<String> _filters = ['Admin', 'Ventas', 'Empleados'];

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
