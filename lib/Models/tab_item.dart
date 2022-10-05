import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabItem {
  /// Title for the tabItem
  final Widget title;

  /// SubTitle for the tabItem
  final Widget? subTitle;

  /// onTap on tabItem will only work when tabItemChildren list is empty, as itemChild will have their own onTap to work
  final void Function()? onTap;

  /// selectedIcon and leading selected icon in tile.
  final Widget? selectedIcon;

  /// unSelectedIcon and leading unselected icon in tile.
  final Widget? unSelectedIcon;

  /// Trailing widget for the tabItem for tile.
  final Widget? trailing;

  /// The widget corresponding to the tab item
  final Widget? tabWidget;

  /// Will show a badge on top of tabbar item, default: false.
  final bool? showBadge;

  /// Will show a badge count on top of tabbar item, to enable make showBadge true.
  final int? badgeCount;

  /// Sub children which will be seen when expanded
  final List<TabItem>? tabItemChildren;

  const TabItem({
    required this.title,
    required this.onTap,
    this.subTitle,
    this.selectedIcon = const Icon(CupertinoIcons.circle_fill, size: 10),
    this.unSelectedIcon = const Icon(Icons.circle_outlined, size: 10),
    this.trailing,
    this.tabWidget = const Center(child: Text("Tab-Widget")),
    this.showBadge = false,
    this.badgeCount,
    this.tabItemChildren = const [],
  });
}
