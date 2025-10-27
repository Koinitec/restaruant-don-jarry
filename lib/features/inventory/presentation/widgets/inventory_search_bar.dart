import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/widgets/search/search_bar_widget.dart';

class InventorySearchBar extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const InventorySearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<InventorySearchBar> createState() => _InventorySearchBarState();
}

class _InventorySearchBarState extends State<InventorySearchBar> {
  @override
  Widget build(BuildContext context) {
    return SearchBarWidget(
      controller: widget.controller,
      onChanged: widget.onChanged,
      hintText: 'Buscar producto...',
      prefixIcon: FIcons.search,
      backgroundColor: Colors.grey.shade200,
      iconColor: Colors.grey,
      onClear: () {
        debugPrint('Campo de búsqueda limpiado');
      },
    );
  }
}
