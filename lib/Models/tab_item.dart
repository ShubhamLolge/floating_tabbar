import 'package:flutter/material.dart';

class TabItem {
  /// Will show for unselected icon
  final Widget icon;

  /// Will show for selected icon
  final Widget selectedIcon;

  /// Will show label under the icon
  final String label;

  /// The widget corresponding to the tab item
  final Widget tabWidget;

  /// Will show a badge count on top of tabbar item, default: false
  final int? badgeCount;

  /// Will show a badge on top of tabbar item, default: false
  final bool showBadge;
  const TabItem({
    this.icon = const Icon(Icons.icecream_outlined),
    this.selectedIcon = const Icon(Icons.icecream),
    required this.label,
    required this.tabWidget,
    this.badgeCount,
    this.showBadge = false,
  });
}
