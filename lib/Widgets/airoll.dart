import 'package:floating_tabbar/Models/tab_item.dart';
import 'package:floating_tabbar/Services/utils.dart';
import 'package:floating_tabbar/Widgets/floater.dart';
import 'package:flutter/material.dart';

/// [Airoll] is a customised [PopupMenuButton] that accepts its children in the list on [TabItem].
class Airoll extends StatefulWidget {
  /// [title] represents the widget on the [PopupMenuButton] may it be [Text] or [Icon]
  /// onclick of which [PopupMenuButton]'s children will be shown.
  final Widget child;

  /// Deafult value true, different value used for internal working of the widget.
  ///
  /// This is needed for nesting items if any,
  /// do not change the value to false as it may change the appearance of the [PopupMenuButton].
  final bool isParent;

  /// Default value false, when false [PopupMenuButton] acts on click
  final bool actOnHover;

  /// Default value true.
  ///
  /// If you want to customise the [Floater] widget then assign false value for [isFloating]
  /// and wrap the [Airoll] widget with [Floater] and customise as per your wish.
  final bool isFloating;

  /// List of [TabItem] that will be children of [PopupMenuButton]
  final List<TabItem>? children;

  /// The content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common use cases.
  ///
  /// The [clipBehavior] argument is used the clip shape of the menu.
  ///
  /// Defaults to [Clip.none], and must not be null.
  final Clip clipBehavior;

  /// If provided, the background color used for the menu.
  ///
  /// If this property is null, then [PopupMenuThemeData.color] is used. If [PopupMenuThemeData.color] is also null, then Theme.of(context).cardColor is used.
  final Color? color;

  /// Optional size constraints for the menu.
  ///
  /// When unspecified, defaults to:
  /// ```dart
  /// const BoxConstraints(
  ///   minWidth: 2.0 * 56.0,
  ///   maxWidth: 5.0 * 56.0,
  /// )
  /// ```
  /// The default constraints ensure that the menu width matches maximum width recommended by the Material Design guidelines. Specifying this parameter enables creation of menu wider than the default maximum width.
  final BoxConstraints? constraints;

  /// The z-coordinate at which to place the menu when open. This controls the size of the shadow below the menu.
  ///
  /// Defaults to 8, the appropriate elevation for popup menus.
  final double? elevation;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:

  /// [Feedback] for providing platform-specific feedback to certain actions.
  final bool? enableFeedback;

  /// Whether this popup menu button is interactive.
  ///
  /// Must be non-null, defaults to true
  ///
  /// If true the button will respond to presses by displaying the menu.
  ///
  /// If false, the button is styled with the disabled color from the current [Theme] and will not respond to presses or show the popup menu and [onSelected], [onCanceled] and [itemBuilder] will not be called.
  ///
  /// This can be useful in situations where the app needs to show the button, but doesn't currently have anything to show in the menu.
  final bool enabled;

  /// If provided, the [icon] is used for this button and the button will behave like an [IconButton].
  final Widget? icon;

  /// If provided, the size of the [Icon].
  ///
  /// If this property is null, then [IconThemeData.size] is used. If [IconThemeData.size] is also null, then default size is 24.0 pixels.
  final double? iconSize;

  /// The value of the menu item, if any, that should be highlighted when the menu opens.
  final TabItem? initialValue;

  /// Called when the user dismisses the popup menu without selecting an item.
  ///
  /// If the user selects a value, [onSelected] is called instead.
  final void Function()? onCanceled;

  /// Called when the popup menu is shown.
  final void Function()? onOpened;

  /// Matches IconButton's 8 dps padding by default. In some cases, notably where this button appears as the trailing element of a list item, it's useful to be able to set the padding to zero.
  final EdgeInsetsGeometry padding;

  /// Whether the popup menu is positioned over or under the popup menu button.
  ///
  /// [offset] is used to change the position of the popup menu relative to the position set by this parameter.
  ///
  /// If this property is null, then [PopupMenuThemeData.position] is used. If [PopupMenuThemeData.position] is also null, then the position defaults to [PopupMenuPosition.over] which makes the popup menu appear directly over the button that was used to create it.
  final PopupMenuPosition? position;

  /// The color used to paint the shadow below the menu.
  ///
  /// If null then the ambient [PopupMenuThemeData.shadowColor] is used. If that is null too, then the overall theme's [ThemeData.shadowColor] (default black) is used.
  final Color? shadowColor;

  /// If provided, the shape used for the menu.
  ///
  /// If this property is null, then [PopupMenuThemeData.shape] is used. If [PopupMenuThemeData.shape] is also null, then the default shape for [MaterialType.card] is used. This default shape is a rectangle with rounded edges of BorderRadius.circular(2.0).
  final ShapeBorder? shape;

  /// The splash radius.
  ///
  /// If null, default splash radius of [InkWell] or [IconButton] is used.
  final double? splashRadius;

  /// The color used as an overlay on [color] to indicate elevation.
  ///
  /// If null, [PopupMenuThemeData.surfaceTintColor] is used. If that is also null, the default value is [ColorScheme.surfaceTint].
  ///
  /// See [Material.surfaceTintColor] for more details on how this overlay is applied.
  final Color? surfaceTintColor;

  /// Text that describes the action that will occur when the button is pressed.
  ///
  /// This text is displayed when the user long-presses on the button and is used for accessibility.
  final String? tooltip;

  const Airoll({
    Key? key,
    required this.child,
    this.children = const [],
    this.isParent = true,
    this.actOnHover = false,
    this.isFloating = true,
    this.clipBehavior = Clip.none,
    this.padding = const EdgeInsets.all(8.0),
    this.color,
    this.constraints,
    this.elevation,
    this.enableFeedback,
    this.enabled = true,
    this.icon,
    this.iconSize,
    this.initialValue,
    this.onCanceled,
    this.onOpened,
    this.position,
    this.shadowColor,
    this.shape,
    this.splashRadius,
    this.surfaceTintColor,
    this.tooltip,
  }) : super(key: key);

  @override
  State<Airoll> createState() => _AirollState();
}

class _AirollState extends State<Airoll> {
  bool _isHovering = false;
  final GlobalKey<PopupMenuButtonState> _menuKey =
      GlobalKey<PopupMenuButtonState>();

  @override
  Widget build(BuildContext context) {
    return widget.actOnHover
        ? MouseRegion(
            onHover: (_) => handleEnter(true),
            child: widget.isFloating == true
                ? Floater(child: menuWidget())
                : menuWidget(),
          )
        : widget.isFloating == true
            ? Floater(child: menuWidget())
            : menuWidget();
  }

  Widget menuWidget() {
    return Container(
      margin: widget.isParent == true ? const EdgeInsets.all(8.0) : null,
      child: PopupMenuButton<TabItem>(
        clipBehavior: widget.clipBehavior,
        color: widget.color,
        constraints: widget.constraints,
        elevation: widget.elevation,
        enableFeedback: widget.enableFeedback,
        enabled: widget.enabled,
        icon: widget.icon,
        iconSize: widget.iconSize,
        initialValue: widget.initialValue,
        onCanceled: widget.onCanceled,
        onOpened: widget.onOpened,
        padding: widget.padding,
        position: widget.position,
        shadowColor: widget.shadowColor,
        shape: widget.shape,
        splashRadius: widget.splashRadius,
        surfaceTintColor: widget.surfaceTintColor,
        tooltip:
            widget.tooltip ?? getStringFromTextWidget(widget.child.toString()),
        key: _menuKey,
        onSelected: (TabItem result) {},
        offset: const Offset(0, kToolbarHeight),
        itemBuilder: (BuildContext context) => widget.children!.map(
          (item) {
            return PopupMenuItem<TabItem>(
              value: item,
              child: item.children!.isNotEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Airoll(
                          child: item.title,
                          children: item.children,
                          isParent: false,
                          actOnHover: widget.actOnHover,
                          isFloating: false,
                        ),
                        if (item.children!.isNotEmpty)
                          item.trailingIcon ??
                              const Icon(Icons.arrow_right, size: 18),
                      ],
                    )
                  : item.title,
            );
          },
        ).toList(),
        child: widget.child,
      ),
    );
  }

  void handleEnter(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
    PopupMenuButtonState<dynamic>? state = _menuKey.currentState;
    if (_isHovering == true) {
      state!.showButtonMenu();
    }
  }

  void handleExit(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
    if (_isHovering == false) {
      Navigator.pop(context);
    }
  }
}
