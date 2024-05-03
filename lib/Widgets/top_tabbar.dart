import 'package:floating_tabbar/lib.dart';
export 'package:flutter/gestures.dart';

/// ## TopTabBar
/// Widget to create the top [TabBar] with built in space for nesting contingency, just provide the data to [children] parameter
/// and you're done your Top [TabBar] is created like that.
/// Customize the widget as per your liking, also specify if you need the [TabBar] to be primary or secondary,
///
/// Customise the look and feel of the [TopTabBar] by editing [TabBar] and [TabBarView] parameters as per your liking.
///
/// #### Remember all the customization that applies to parent, applies to nested [TopTabBar] as well.
///
class TopTabBar extends StatefulWidget {
  const TopTabBar({
    Key? key,
    this.tabBarKey,
    this.tabBarViewKey,
    required this.children,
    this.indicator,
    this.dividerColor,
    this.enableFeedback,
    this.indicatorColor,
    this.indicatorSize,
    this.labelColor,
    this.labelPadding,
    this.labelStyle,
    this.mouseCursor,
    this.onTap,
    this.overlayColor,
    this.padding,
    this.physics,
    this.splashBorderRadius,
    this.splashFactory,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.tabBarViewPhysics,
    this.animationDuration,
    this.initialIndex = 0,
    this.primaryTabBar = true,
    this.isScrollable = false,
    this.indicatorWeight = 2.0,
    this.tabBarViewViewportFraction = 1.0,
    this.indicatorPadding = EdgeInsets.zero,
    this.tabBarViewClipBehavior = Clip.hardEdge,
    this.automaticIndicatorColorAdjustment = true,
    this.dragStartBehavior = DragStartBehavior.start,
    this.tabBarViewDragStartBehavior = DragStartBehavior.start,
    this.tabAlignment,
  }) : super(key: key);

  /// [Key] for [TabBar].
  final Key? tabBarKey;

  /// [Key] for [TabBarView].
  final Key? tabBarViewKey;

  /// List of TabItem to specifiy the data for the top tabbar.
  ///
  /// Note: if the TabItem has further children then the [tab] property of the tabItem won't be visible as the
  /// space for tab will be occupied by the netsed [TopTabBar].
  final List<TabItem> children;

  /// The index you want to be selected initially.
  final int initialIndex;

  /// Indicator that Defines the appearance of the selected tab.
  final Decoration? indicator;

  /// specifies if the topTabBar is primary or not, if false topTabBar is secondary.
  final bool primaryTabBar;

  /// Default [TabBar] parameter
  ///
  /// Whether this tab bar should automatically adjust the [indicatorColor].
  /// The default value of this property is true.
  /// If [automaticIndicatorColorAdjustment] is true, then the [indicatorColor] will be automatically adjusted to [Colors.white] when the [indicatorColor] is same as [Material.color] of the [Material] parent widget.
  final bool automaticIndicatorColorAdjustment;

  /// Default [TabBar] parameter
  ///
  /// The color of the divider.
  /// If null and [ThemeData.useMaterial3] is true, [TabBarTheme.dividerColor] color is used. If that is null and [ThemeData.useMaterial3] is true, [ColorScheme.surfaceVariant] will be used, otherwise divider will not be drawn.
  final Color? dividerColor;

  /// Default [TabBar] parameter
  ///
  /// Determines the way that drag start behavior is handled.
  ///
  /// If set to [DragStartBehavior.start], scrolling drag behavior will begin at the position where the drag gesture won the arena. If set to [DragStartBehavior.down] it will begin at the position where a down event is first detected.
  ///
  /// In general, setting this to [DragStartBehavior.start] will make drag animation smoother and setting it to [DragStartBehavior.down] will make drag behavior feel slightly more reactive.
  ///
  /// By default, the drag start behavior is [DragStartBehavior.start].
  ///
  /// See also:
  ///
  /// [DragGestureRecognizer.dragStartBehavior], which gives an example for the different behaviors.
  final DragStartBehavior dragStartBehavior;

  /// Default [TabBar] parameter
  ///
  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a long-press will produce a short vibration, when feedback is enabled.
  ///
  /// Defaults to true.
  final bool? enableFeedback;

  /// Default [TabBar] parameter
  ///
  /// The color of the line that appears below the selected tab.
  ///
  /// If this parameter is null, then the value of the Theme's indicatorColor property is used.
  ///
  /// If [indicator] is specified or provided from [TabBarTheme], this property is ignored.
  final Color? indicatorColor;

  /// Default [TabBar] parameter
  ///
  /// The padding for the indicator.
  ///
  ///The default value of this property is [EdgeInsets.zero].
  ///
  /// For [isScrollable] tab bars, specifying [kTabLabelPadding] will align the indicator with the tab's text for [Tab] widgets and all but the shortest [Tab.text] values.
  final EdgeInsetsGeometry indicatorPadding;

  /// Default [TabBar] parameter
  ///
  /// Defines how the selected tab indicator's size is computed.
  ///
  /// The size of the selected tab indicator is defined relative to the tab's overall bounds if [indicatorSize] is [TabBarIndicatorSize.tab] (the default) or relative to the bounds of the tab's widget if [indicatorSize] is [TabBarIndicatorSize.label].
  ///
  /// The selected tab's location appearance can be refined further with the [indicatorColor], [indicatorWeight], [indicatorPadding], and [indicator] properties.
  final TabBarIndicatorSize? indicatorSize;

  /// Default [TabBar] parameter
  ///
  /// The thickness of the line that appears below the selected tab.
  ///
  ///The value of this parameter must be greater than zero and its default value is 2.0.
  ///
  /// If [indicator] is specified or provided from [TabBarTheme], this property is ignored.
  final double indicatorWeight;

  /// Default [TabBar] parameter
  ///
  /// Whether this tab bar can be scrolled horizontally.
  ///
  /// If [isScrollable] is true, then each tab is as wide as needed for its label and the entire [TabBar] is scrollable. Otherwise each tab gets an equal share of the available space.
  final bool isScrollable;

  /// Default [TabBar] parameter
  ///
  /// The color of selected tab labels.
  ///
  /// If null, then [TabBarTheme.labelColor] is used. If that is also null and [ThemeData.useMaterial3] is true, [ColorScheme.primary] will be used, otherwise the color of the [ThemeData.primaryTextTheme]'s [TextTheme.bodyLarge] text color is used.
  ///
  /// If [labelColor] (or, if null, [TabBarTheme.labelColor]) is a [MaterialStateColor], then the effective tab color will depend on the [MaterialState.selected] state, i.e. if the [Tab] is selected or not, ignoring [unselectedLabelColor] even if it's non-null.
  ///
  /// The color specified in the [labelStyle] and the [TabBarTheme.labelStyle] do not affect the effective [labelColor].
  ///
  /// See also:
  ///
  /// [unselectedLabelColor], for color of unselected tab labels.
  final Color? labelColor;

  /// Default [TabBar] parameter
  ///
  /// The padding added to each of the tab labels.
  ///
  /// If there are few tabs with both icon and text and few tabs with only icon or text, this padding is vertically adjusted to provide uniform padding to all tabs.
  ///
  /// If this property is null, then kTabLabelPadding is used.
  final EdgeInsetsGeometry? labelPadding;

  /// Default [TabBar] parameter
  ///
  /// The text style of the selected tab labels.
  ///
  /// This does not influence color of the tab labels even if [TextStyle.color] is non-null. Refer [labelColor] to color selected tab labels instead.
  ///
  /// If [unselectedLabelStyle] is null, then this text style will be used for both selected and unselected label styles.
  ///
  /// If this property is null and [ThemeData.useMaterial3] is true, [TextTheme.titleSmall] will be used, otherwise the text style of the [ThemeData.primaryTextTheme]'s [TextTheme.bodyLarge] definition is used.
  final TextStyle? labelStyle;

  /// Default [TabBar] parameter
  ///
  /// The cursor for a mouse pointer when it enters or is hovering over the individual tab widgets.
  ///
  /// If [mouseCursor] is a [MaterialStateProperty], [MaterialStateProperty.resolve] is used for the following [MaterialState]s:
  ///
  /// [MaterialState.selected].
  /// If null, then the value of [TabBarTheme.mouseCursor] is used. If that is also null, then [MaterialStateMouseCursor.clickable] is used.
  ///
  /// See also:
  ///
  /// [MaterialStateMouseCursor], which can be used to create a [MouseCursor] that is also a [MaterialStateProperty].
  final MouseCursor? mouseCursor;

  /// Default [TabBar] parameter
  ///
  /// An optional callback that's called when the [TabBar] is tapped.
  ///
  /// The callback is applied to the index of the tab where the tap occurred.
  ///
  /// This callback has no effect on the default handling of taps. It's for applications that want to do a little extra work when a tab is tapped, even if the tap doesn't change the TabController's index. TabBar [onTap] callbacks should not make changes to the TabController since that would interfere with the default tap handler.
  final void Function(int)? onTap;

  /// Default [TabBar] parameter
  ///
  /// Defines the ink response focus, hover, and splash colors.
  ///
  /// If non-null, it is resolved against one of [MaterialState.focused], [MaterialState.hovered], and [MaterialState.pressed].
  ///
  /// [MaterialState.pressed] triggers a ripple (an ink splash), per the current Material Design spec.
  ///
  /// If the overlay color is null or resolves to null, then the default values for [InkResponse.focusColor], [InkResponse.hoverColor], [InkResponse.splashColor], and [InkResponse.highlightColor] will be used instead.
  ///
  /// ```dart
  /// // Example
  /// const MaterialStatePropertyAll(Colors.amber)
  /// ```
  final MaterialStateProperty<Color?>? overlayColor;

  /// Default [TabBar] parameter
  ///
  /// The amount of space by which to inset the tab bar.
  ///
  /// When [isScrollable] is false, this will yield the same result as if [TabBar] was wrapped in a [Padding] widget. When [isScrollable] is true, the scrollable itself is inset, allowing the padding to scroll with the tab bar, rather than enclosing it.
  ///
  final EdgeInsetsGeometry? padding;

  /// Default [TabBar] parameter
  ///
  /// How the [TabBar]'s scroll view should respond to user input.
  ///
  /// For example, determines how the scroll view continues to animate after the user stops dragging the scroll view.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? physics;

  /// Default [TabBar] parameter
  ///
  /// Defines the clipping radius of splashes that extend outside the bounds of the tab.
  ///
  /// This can be useful to match the [BoxDecoration.borderRadius] provided as [indicator].
  ///``` dart
  /// TabBar(
  ///   indicator: BoxDecoration(
  ///     borderRadius: BorderRadius.circular(40),
  ///   ),
  ///   splashBorderRadius: BorderRadius.circular(40),
  ///   tabs: const <Widget>[
  ///     // ...
  ///   ],
  /// )
  /// ```
  /// If this property is null, it is interpreted as [BorderRadius.zero].
  final BorderRadius? splashBorderRadius;

  /// Default [TabBar] parameter
  ///
  /// Creates the tab bar's [InkWell] splash factory, which defines the appearance of "ink" splashes that occur in response to taps.
  ///
  /// Use [NoSplash.splashFactory] to defeat ink splash rendering. For example to defeat both the splash and the hover/pressed overlay, but not the keyboard focused overlay:
  /// ``` dart
  /// TabBar(
  ///   splashFactory: NoSplash.splashFactory,
  ///   overlayColor: MaterialStateProperty.resolveWith<Color?>(
  ///     (Set<MaterialState> states) {
  ///       return states.contains(MaterialState.focused) ? null : Colors.transparent;
  ///     },
  ///   ),
  ///   tabs: const <Widget>[
  ///     // ...
  ///   ],
  /// )
  /// ```
  final InteractiveInkFeatureFactory? splashFactory;

  /// Default [TabBar] parameter
  ///
  /// The color of unselected tab labels.
  ///
  /// If [labelColor] (or, if null, [TabBarTheme.labelColor]) is a [MaterialStateColor], then the unselected tabs are rendered with that [MaterialStateColor]'s resolved color for unselected state, even if [unselectedLabelColor] is non-null.
  ///
  /// If null, then [TabBarTheme.unselectedLabelColor] is used. If that is also null and [ThemeData.useMaterial3] is true, [ColorScheme.onSurfaceVariant] will be used, otherwise unselected tab labels are rendered with [labelColor] at 70% opacity.
  ///
  /// The color specified in the [unselectedLabelStyle] and the [TabBarTheme.unselectedLabelStyle] are ignored in [unselectedLabelColor]'s precedence calculation.
  ///
  /// See also:
  ///
  /// [labelColor], for color of selected tab labels.
  final Color? unselectedLabelColor;

  /// Default [TabBar] parameter
  ///
  /// The text style of the unselected tab labels.
  ///
  /// This does not influence color of the tab labels even if [TextStyle.color] is non-null. Refer [unselectedLabelColor] to color unselected tab labels instead.
  ///
  /// If this property is null and [ThemeData.useMaterial3] is true, [TextTheme.titleSmall] will be used, otherwise then the [labelStyle] value is used. If [labelStyle] is null, the text style of the [ThemeData.primaryTextTheme]'s [TextTheme.bodyLarge] definition is used.
  final TextStyle? unselectedLabelStyle;

  /// Default [TabBarView] parameter
  ///
  /// Determines the way that drag start behavior is handled.
  ///
  /// If set to [DragStartBehavior.start], scrolling drag behavior will begin at the position where the drag gesture won the arena. If set to [DragStartBehavior.down] it will begin at the position where a down event is first detected.
  ///
  /// In general, setting this to [DragStartBehavior.start] will make drag animation smoother and setting it to [DragStartBehavior.down] will make drag behavior feel slightly more reactive.
  ///
  /// By default, the drag start behavior is [DragStartBehavior.start].
  ///
  /// See also:
  ///
  /// [DragGestureRecognizer.dragStartBehavior], which gives an example for the different behaviors.
  final DragStartBehavior tabBarViewDragStartBehavior;

  /// Default [TabBarView] parameter
  ///
  /// How the page view should respond to user input.
  ///
  /// For example, determines how the page view continues to animate after the user stops dragging the page view.
  ///
  /// The physics are modified to snap to page boundaries using [PageScrollPhysics] prior to being used.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? tabBarViewPhysics;

  /// Default [TabBarView] parameter
  ///
  /// The content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common use cases.
  ///
  /// Defaults to [Clip.hardEdge].
  final Clip tabBarViewClipBehavior;

  /// Default [TabBarView] parameter
  ///
  /// The fraction of the viewport that each page should occupy.
  ///
  /// Defaults to 1.0, which means each page fills the viewport in the scrolling direction.
  final double tabBarViewViewportFraction;

  /// Creates an object that manages the state required by [TabBar] and a [TabBarView].
  ///
  /// The [length] must not be null or negative. Typically it's a value greater than one, i.e. typically there are two or more tabs. The [length] must match [TabBar.tabs]'s and [TabBarView.children]'s length.
  ///
  /// The initialIndex must be valid given [length] and must not be null. If [length] is zero, then initialIndex must be 0 (the default).
  final Duration? animationDuration;

  ///
  final TabAlignment? tabAlignment;

  @override
  State<TopTabBar> createState() => TopTabBarState();
}

class TopTabBarState extends State<TopTabBar>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.children.length,
      vsync: this,
      initialIndex: widget.initialIndex,
      animationDuration: widget.animationDuration,
    );
  }

  List<Widget> getLabels() {
    List<Widget> labels = [];
    for (var child in widget.children) {
      Widget lebs = Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child.title,
            child.subTitle ?? Container(),
          ],
        ),
      );
      Widget tab = Tab(
        icon: child.selectedLeading,
        child: child.badgeCount == 0
            ? lebs
            : NotificationBadge(count: child.badgeCount ?? 0, child: lebs),
      );

      labels.add(
        child.tIOnTap == true
            ? InkWell(
                onTap: child.onTap,
                child: tab,
              )
            : tab,
      );
    }
    return labels;
  }

  List<Widget> getTabs() {
    List<Widget> tabs = [];
    for (var child in widget.children) {
      if (child.children!.isNotEmpty && child.children != null) {
        tabs.add(
          TopTabBar(
            children: child.children!,
            indicator: widget.indicator,
            initialIndex: widget.initialIndex,
            primaryTabBar: widget.primaryTabBar,
            animationDuration: widget.animationDuration,
            automaticIndicatorColorAdjustment:
                widget.automaticIndicatorColorAdjustment,
            dividerColor: widget.dividerColor,
            dragStartBehavior: widget.dragStartBehavior,
            enableFeedback: widget.enableFeedback,
            indicatorColor: widget.indicatorColor,
            indicatorPadding: widget.indicatorPadding,
            indicatorSize: widget.indicatorSize,
            indicatorWeight: widget.indicatorWeight,
            isScrollable: widget.isScrollable,
            labelPadding: widget.labelPadding,
            mouseCursor: widget.mouseCursor,
            onTap: (value) => widget.onTap!(value),
            overlayColor: widget.overlayColor,
            padding: widget.padding,
            physics: widget.physics,
            splashBorderRadius: widget.splashBorderRadius,
            splashFactory: widget.splashFactory,
            tabBarViewClipBehavior: widget.tabBarViewClipBehavior,
            tabBarViewDragStartBehavior: widget.tabBarViewDragStartBehavior,
            tabBarViewPhysics: widget.tabBarViewPhysics,
            tabBarViewViewportFraction: widget.tabBarViewViewportFraction,
            labelColor: widget.labelColor ?? Theme.of(context).primaryColor,
            labelStyle: widget.labelStyle,
            unselectedLabelColor: widget.unselectedLabelColor,
            unselectedLabelStyle: widget.unselectedLabelStyle,
            tabAlignment: widget.tabAlignment,
          ),
        );
      } else {
        tabs.add(
          child.tab ??
              const Center(
                child: Text(
                    "No specified widget for this tab in the TabItem, please provide one in the list<TabItem> children."),
              ),
        );
      }
    }
    return tabs;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        widget.primaryTabBar == true
            ? TabBar(
                tabAlignment: widget.tabAlignment,
                indicator: widget.indicator,
                controller: _tabController,
                tabs: getLabels(),
                automaticIndicatorColorAdjustment:
                    widget.automaticIndicatorColorAdjustment,
                dividerColor: widget.dividerColor,
                dragStartBehavior: widget.dragStartBehavior,
                enableFeedback: widget.enableFeedback,
                indicatorColor: widget.indicatorColor,
                indicatorPadding: widget.indicatorPadding,
                indicatorSize: widget.indicatorSize,
                indicatorWeight: widget.indicatorWeight,
                isScrollable: widget.isScrollable,
                key: widget.tabBarKey,
                labelPadding: widget.labelPadding,
                mouseCursor: widget.mouseCursor,
                onTap: (value) => widget.onTap!(value),
                overlayColor: widget.overlayColor,
                padding: widget.padding,
                physics: widget.physics,
                splashBorderRadius: widget.splashBorderRadius,
                splashFactory: widget.splashFactory,
                labelColor: widget.labelColor ?? Theme.of(context).primaryColor,
                labelStyle: widget.labelStyle,
                unselectedLabelColor: widget.unselectedLabelColor,
                unselectedLabelStyle: widget.unselectedLabelStyle,
              )
            : TabBar.secondary(
                tabAlignment: widget.tabAlignment,
                indicator: widget.indicator,
                controller: _tabController,
                tabs: getLabels(),
                automaticIndicatorColorAdjustment:
                    widget.automaticIndicatorColorAdjustment,
                dividerColor: widget.dividerColor,
                dragStartBehavior: widget.dragStartBehavior,
                enableFeedback: widget.enableFeedback,
                indicatorColor: widget.indicatorColor,
                indicatorPadding: widget.indicatorPadding,
                indicatorSize: widget.indicatorSize,
                indicatorWeight: widget.indicatorWeight,
                isScrollable: widget.isScrollable,
                key: widget.tabBarKey,
                labelPadding: widget.labelPadding,
                mouseCursor: widget.mouseCursor,
                onTap: (value) => widget.onTap!(value),
                overlayColor: widget.overlayColor,
                padding: widget.padding,
                physics: widget.physics,
                splashBorderRadius: widget.splashBorderRadius,
                splashFactory: widget.splashFactory,
                labelColor: widget.labelColor ?? Theme.of(context).primaryColor,
                labelStyle: widget.labelStyle,
                unselectedLabelColor: widget.unselectedLabelColor,
                unselectedLabelStyle: widget.unselectedLabelStyle,
              ),
        Expanded(
          child: TabBarView(
            key: widget.tabBarViewKey,
            clipBehavior: widget.tabBarViewClipBehavior,
            dragStartBehavior: widget.tabBarViewDragStartBehavior,
            physics: widget.tabBarViewPhysics,
            viewportFraction: widget.tabBarViewViewportFraction,
            controller: _tabController,
            children: getTabs(),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
