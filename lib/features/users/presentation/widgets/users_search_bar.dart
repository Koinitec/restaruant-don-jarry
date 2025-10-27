import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/widgets/search/search_bar_widget.dart';

class UsersSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const UsersSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<UsersSearchBar> createState() => _UsersSearchBarState();
}

class _UsersSearchBarState extends State<UsersSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SearchBarWidget(
      controller: widget.controller,
      onChanged: widget.onChanged,
      hintText: 'Buscar usuario...',
      prefixIcon: FIcons.search,
      backgroundColor: Colors.grey.shade200,
      iconColor: Colors.grey,
      onClear: () {
        debugPrint('Campo de búsqueda limpiado');
      },
    );
  }
}
