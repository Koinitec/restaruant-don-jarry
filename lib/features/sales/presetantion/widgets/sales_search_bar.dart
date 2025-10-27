import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/widgets/search/search_bar_widget.dart';

class SalesSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const SalesSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<SalesSearchBar> createState() => _SalesSearchBarState();
}

class _SalesSearchBarState extends State<SalesSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SearchBarWidget(
      controller: widget.controller,
      onChanged: widget.onChanged,
      hintText: 'Buscar venta...',
      prefixIcon: FIcons.search,
      backgroundColor: Colors.grey.shade200,
      iconColor: Colors.grey,
      onClear: () {
        debugPrint('Campo de búsqueda limpiado');
      },
    );
  }
}
