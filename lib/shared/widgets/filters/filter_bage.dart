import 'package:forui/forui.dart';
import 'package:flutter/material.dart';

class FilterBadge extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const FilterBadge({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FBadge(
        style: selected ? FBadgeStyle.primary() : FBadgeStyle.secondary(),
        child: Text(label),
      ),
    );
  }
}
