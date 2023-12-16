import 'package:floating_tabbar/lib.dart';

class TabItem {
  /// Title for the tabItem
  final Widget title;

  /// onTap on tabItem will only work when itemChild list is empty, as itemChild will have their own onTap to work
  final void Function()? onTap;

  /// With true value the function provided for [onTap] will be called when clicked on the tab,
  /// if false then the default tab change function will be called.
  final bool useTIOnTap;

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

  /// Will show a badge count on top of tabbar item, to enable make showBadge true.
  final int? badgeCount;

  /// Sub children which will be seen when expanded
  final List<TabItem>? children;

  /// Associated Color.
  final Color? color;

  const TabItem({
    required this.title,
    required this.onTap,
    this.subTitle,
    this.selectedLeadingIcon,
    this.unSelectedLeadingIcon,
    this.trailingIcon,
    this.tab,
    this.badgeCount = 0,
    this.color,
    this.useTIOnTap = false,
    this.children = const [],
  });
}
