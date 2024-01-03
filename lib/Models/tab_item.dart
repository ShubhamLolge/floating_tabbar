import 'package:floating_tabbar/lib.dart';
import 'package:floating_tabbar/floating_tabbar.dart';

class TabItem {
  /// Title for the tabItem
  final Widget title;

  /// onTap on tabItem will only work when itemChild list is empty, as itemChild will have their own onTap to work
  final void Function()? onTap;

  /// With true value the function provided for [onTap] will be called when clicked on the tab,
  /// if false then the default widget functions used in different widgets will be called.
  final bool tIOnTap;

  /// SubTitle for the tabItem
  final Widget? subTitle;

  /// Will show for leading selected icon
  ///
  /// - When using for [FloatingTabBar] always provide value for [selectedLeading] as it show on bottom nav bar.
  /// - When using for [TopTabBar] keeping it null can also take it through.
  final Widget? selectedLeading;

  /// Will show for leading unselected icon
  final Widget? unSelectedLeading;

  /// Trailing widget for the tabItem
  final Widget? trailing;

  /// The widget corresponding to the tab item
  ///
  /// - If provided [tab] for [FloatingTabBar] even for a single [TabItem] object then provide for all objects in the [children] list.
  final Widget? tab;

  /// Will show a badge count on top of tabbar item, to enable make showBadge true.
  final int? badgeCount;

  /// Sub children which will be seen when expanded
  final List<TabItem>? children;

  /// Color associated with [TabItem] this not for text or icons but for body of [TiUi].
  ///
  /// Implementation pending in some of the [FloatingTabBar] package widgets
  final Color? color;

  /// To enable or disable tabitem.
  ///
  /// Implementation pending in some of the [FloatingTabBar] package widgets
  final bool? enabled;

  /// inSelected bool to give indication that the specific tabItem is selected or visited.
  ///
  /// Implementation pending in some of the [FloatingTabBar] package widgets
  final Function(bool)? isSelected;

  const TabItem({
    required this.title,
    required this.onTap,
    this.enabled,
    this.isSelected,
    this.subTitle,
    this.selectedLeading,
    this.unSelectedLeading,
    this.trailing,
    this.tab,
    this.badgeCount = 0,
    this.color,
    this.tIOnTap = false,
    this.children = const [],
  });
}
