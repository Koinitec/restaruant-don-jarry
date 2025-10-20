import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'sidebar_header.dart';
import 'sidebar_footer.dart';

/// SidebarWidget: componente reutilizable basado en [FSidebar].
///
/// Este widget permite crear un sidebar completo y adaptable en tu app.
/// Puedes personalizarlo con:
/// - [header]: widget que se muestra en la parte superior (opcional)
/// - [footer]: widget que se muestra en la parte inferior (opcional)
/// - [groups]: lista de [FSidebarGroup] con los elementos del menú (requerido)
///
/// Si no proporcionas [header] o [footer], el widget genera un diseño limpio por defecto.
/// También puedes definir [title], [subtitle] y [userIcon] para que se muestren en el footer.
///
/// Ejemplo de uso:
/// ```dart
/// SidebarWidget(
///   title: 'Panel',
///   subtitle: 'Administrador',
///   userIcon: FIcons.userRound,
///   groups: [
///     FSidebarGroup(
///       label: Text('General'),
///       children: [
///         FSidebarItem(
///           icon: Icon(FIcons.home),
///           label: Text('Inicio'),
///           onPress: () {},
///         ),
///       ],
///     ),
///   ],
/// )
/// ```
class SidebarWidget extends StatelessWidget {
  final List<FSidebarGroup> groups;
  final String? title;
  final String? subtitle;
  final IconData? userIcon;
  final Widget? header;
  final Widget? footer;

  const SidebarWidget({
    super.key,
    required this.groups,
    this.title,
    this.subtitle,
    this.userIcon,
    this.header,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    final theme = FTheme.of(context);

    return FSidebar(
      header: header ?? SidebarHeader(title: title, theme: theme),
      footer:
          footer ??
          SidebarFooter(
            title: title,
            subtitle: subtitle,
            userIcon: userIcon,
            theme: theme,
          ),
      children: groups,
    );
  }
}
