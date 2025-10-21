import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/widgets/search/search_bar_widget.dart';

class SalesSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const SalesSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBarWidget(
      controller: controller,
      onChanged: onChanged,
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
