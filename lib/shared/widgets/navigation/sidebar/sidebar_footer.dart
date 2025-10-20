import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class SidebarFooter extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? userIcon;
  final FThemeData theme;

  const SidebarFooter({
    super.key,
    this.title,
    this.subtitle,
    this.userIcon,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final hasContent = (title ?? '').isNotEmpty || (subtitle ?? '').isNotEmpty;

    return Visibility(
      visible: hasContent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: FCard.raw(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Row(
              children: [
                FAvatar.raw(
                  child: Icon(
                    userIcon ?? FIcons.userRound,
                    size: 18,
                    color: theme.colors.mutedForeground,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title ?? '',
                        style: theme.typography.sm.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colors.foreground,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        subtitle ?? '',
                        style: theme.typography.xs.copyWith(
                          color: theme.colors.mutedForeground,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
