import 'package:floating_tabbar/lib.dart';
import 'package:floating_tabbar/floating_tabbar.dart';

class TabItem {
  /// Title for the tabItem
  final Widget title;

  /// Callback spicific to the [TabItem].
  final void Function()? onTap;

  /// With true value the function provided for [onTap] will be called when clicked on the tab,
  /// if false, either default or anonymous function is called.
  final bool tIOnTap;

  /// SubTitle for the tabItem
  final Widget? subTitle;

  /// Will show for leading selected icon
  ///
  /// - Majority widgets in the package will use [selectedLeading] as leading widget but [unSelectedLeading] also works.
  /// - When using for [FloatingTabBar] always provide value for [selectedLeading] as it show on bottom nav bar.
  /// - When using for [TopTabBar] keeping it null can also take it through.
  final Widget? selectedLeading;

  /// Will show for un-leading unselected icon
  final Widget? unSelectedLeading;

  /// Trailing widget for the tabItem
  final Widget? trailing;

  /// The widget corresponding to the tab item
  ///
  /// - If provided [tab] for [FloatingTabBar] even for a single [TabItem] object, then provide for all objects in the [children] list.
  final Widget? tab;

  /// Will show a badge count on top of [TabItem], when a positive value is provided.
  final int? badgeCount;

  /// Children of the current [TabItem].
  final List<TabItem>? children;

  /// Color associated with [TabItem].
  ///
  /// Implementation pending in some of the [FloatingTabBar] package widgets
  final Color? color;

  /// To enable or disable tabitem.
  ///
  /// Implementation pending in some of the [FloatingTabBar] package widgets
  final bool? enabled;

  /// Boolean to indicate the specific tabItem is selected or visited.
  ///
  /// Implementation pending in some of the [FloatingTabBar] package widgets
  final Function(bool)? isSelected;

  const TabItem({
    required this.title,
    required this.onTap,
    this.tIOnTap = false,
    this.subTitle,
    this.selectedLeading,
    this.unSelectedLeading,
    this.trailing,
    this.tab,
    this.badgeCount = 0,
    this.children = const [],
    this.color,
    this.enabled,
    this.isSelected,
  });
}
