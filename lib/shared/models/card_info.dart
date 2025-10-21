import 'package:flutter/material.dart';

class CardInfo {
  final IconData icon;
  final String title;
  final String subtitle;
  final String detail;
  final Color color;

  const CardInfo({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.detail,
    required this.color,
  });
}
