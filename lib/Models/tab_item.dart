import 'package:flutter/material.dart';

class TabItem {
  final Widget icon;
  final Widget selectedIcon;
  final String label;
  final Widget tabWidget;
  const TabItem({
    this.icon = const Icon(Icons.icecream_outlined),
    this.selectedIcon = const Icon(Icons.icecream),
    required this.label,
    required this.tabWidget,
  });
}
