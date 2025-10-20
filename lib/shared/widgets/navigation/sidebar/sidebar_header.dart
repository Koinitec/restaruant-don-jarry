import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class SidebarHeader extends StatelessWidget {
  final String? title;
  final FThemeData theme;

  const SidebarHeader({super.key, this.title, required this.theme});

  @override
  Widget build(BuildContext context) {
    final dividerStyle = theme.dividerStyles.horizontalStyle.copyWith.call(
      padding: EdgeInsets.zero,
    );

    return Visibility(
      visible: title != null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? '',
              style: theme.typography.base.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: theme.colors.foreground,
              ),
            ),
            const SizedBox(height: 6),
            FDivider(style: dividerStyle.call),
          ],
        ),
      ),
    );
  }
}
