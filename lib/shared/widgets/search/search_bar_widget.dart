import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

/// Un campo de búsqueda reutilizable con estilo.
///
/// Este widget muestra una barra de búsqueda personalizable que incluye:
/// - Un ícono de búsqueda al inicio.
/// - Un campo de texto para ingresar la consulta.
/// - Un botón para limpiar el texto (ícono de “X”).
///
/// ### Ejemplo de uso:
/// ```dart
/// SearchBar(
///   controller: _searchController,
///   onChanged: (value) {
///     // Actualiza la lista filtrada, por ejemplo
///   },
/// )
/// ```
///
/// ### Parámetros:
/// - [controller]: Controlador del campo de texto.
/// - [onChanged]: Función que se ejecuta al cambiar el texto.
/// - [hintText]: Texto de sugerencia mostrado cuando el campo está vacío.
/// - [prefixIcon]: Ícono mostrado al inicio (por defecto `FIcons.search`).
/// - [showClearButton]: Si se debe mostrar el botón de limpiar (por defecto `true`).
/// - [onClear]: Callback opcional cuando se limpia el campo.
/// - [backgroundColor]: Color de fondo del contenedor.
/// - [iconColor]: Color de los íconos.
///
/// Ideal para usar en pantallas con filtrado de búsqueda,
/// o formularios donde se necesite una entrada rápida y visualmente clara.

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String hintText;
  final IconData prefixIcon;
  final bool showClearButton;
  final VoidCallback? onClear;
  final Color? backgroundColor;
  final Color? iconColor;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onChanged,
    this.hintText = 'Buscar...',
    this.prefixIcon = FIcons.search,
    this.showClearButton = true,
    this.onClear,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Colors.grey.shade200;
    final iColor = iconColor ?? Colors.grey;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Icon(prefixIcon, color: iColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                isDense: true,
              ),
              onChanged: onChanged,
            ),
          ),
          if (showClearButton && controller.text.isNotEmpty)
            GestureDetector(
              onTap: () {
                controller.clear();
                onChanged('');
                onClear?.call();
              },
              child: Icon(FIcons.x, color: iColor, size: 20),
            ),
        ],
      ),
    );
  }
}
