import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class Header extends StatelessWidget {
  final Widget title;
  final List<FHeaderAction> suffixes;
  final bool showBack;
  final VoidCallback? onBack;
  final bool nested;

  const Header({
    super.key,
    required this.title,
    this.suffixes = const [],
    this.showBack = false,
    this.onBack,
    this.nested = false,
  });

  @override
  Widget build(BuildContext context) {
    final prefixes = showBack
        ? [FHeaderAction.back(onPress: onBack ?? () => Navigator.pop(context))]
        : <FHeaderAction>[];

    if (nested) {
      return FHeader.nested(
        title: title,
        prefixes: prefixes,
        suffixes: suffixes,
        titleAlignment: Alignment.center,
      );
    }

    return FHeader(title: title, suffixes: suffixes);
  }
}
