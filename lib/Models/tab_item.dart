import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabItem {
  /// Title for the tabItem
  final Widget title;

  /// onTap on tabItem will only work when itemChild list is empty, as itemChild will have their own onTap to work
  final void Function()? onTap;

  /// SubTitle for the tabItem
  final Widget? subTitle;

  /// Will show for leading selected icon
  final Widget? selectedLeadingIcon;

  /// Will show for leading unselected icon
  final Widget? unSelectedLeadingIcon;

  /// Trailing widget for the tabItem
  final Widget? trailingIcon;

  /// The widget corresponding to the tab item
  final Widget? tab;

  /// Will show a badge on top of tabbar item, default: false.
  final bool? showBadge;

  /// Will show a badge count on top of tabbar item, to enable make showBadge true.
  final int? badgeCount;

  /// Sub children which will be seen when expanded
  final List<TabItem>? children;

  const TabItem({
    required this.title,
    required this.onTap,
    this.subTitle,
    this.selectedLeadingIcon = const Icon(CupertinoIcons.circle_fill, size: 15),
    this.unSelectedLeadingIcon = const Icon(Icons.circle_outlined, size: 15),
    this.trailingIcon,
    this.tab,
    this.showBadge = false,
    this.badgeCount,
    this.children = const [],
  });
}
