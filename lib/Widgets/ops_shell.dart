import 'package:floating_tabbar/lib.dart';

/// ## OpsShell
/// Widget that helps design responsive screens.
///
/// For Small screens [child] of [OpsShell] will look normal, like nothing has wrapped it,
/// but this widget will show responsive similar look as small screen
/// of your app while being creative on large screens.
class OpsShell extends StatefulWidget {
  /// Child that will show as main content of the screen
  final Widget child;

  /// Height of child,
  /// Note: this value will only reflect in large screen
  final double? height;

  /// Width of child,
  /// Note: this value will only reflect in large screen
  final double? width;

  /// Border radius for child,
  /// Note: this value will only reflect in large screen
  final double radius;

  /// Elevation of child,
  /// Note: this value will only reflect in large screen
  final double elevation;

  /// Decoration of child,
  /// Note: this value will only reflect in large screen
  final Decoration? decoration;

  /// Color of child,
  /// Note: this value will only reflect in large screen
  final Color? color;

  /// Add decoration to the background of screen area except [child],
  ///
  /// Note: this value will only reflect in large screen
  ///
  /// like specify color, add image, shadows,...
  ///
  /// Example
  ///
  /// ```dart
  /// BoxDecoration(
  ///   image: DecorationImage(image: NetworkImage(url)),
  ///   color: Colors.green,
  /// ),
  /// ```
  final Decoration? backgroundDecoration;

  /// Alignment of child
  /// Note: this value will only reflect in large screen
  final AlignmentGeometry? alignment;

  /// Defines the duration of animated changes for [shape], [elevation], [shadowColor], [surfaceTintColor] and the elevation overlay if it is applied.
  ///
  /// The default value is [kThemeChangeDuration].
  final Duration animationDuration;

  /// Whether to paint the [shape] border in front of the [child].
  ///
  /// The default value is true. If false, the border will be painted behind the [child].
  final bool borderOnForeground;

  /// The content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common use cases.
  ///
  /// Defaults to [Clip.none], and must not be null.
  final Clip clipBehavior;

  /// The color to paint the shadow below the material.
  ///
  /// If null and [ThemeData.useMaterial3] is true then [ThemeData]'s [ColorScheme.shadow] will be used. If [ThemeData.useMaterial3] is false then [ThemeData.shadowColor] will be used.
  ///
  /// To remove the drop shadow when [elevation] is greater than 0, set [shadowColor] to [Colors.transparent].
  ///
  /// See also:
  ///
  /// [ThemeData.useMaterial3], which determines the default value for this property if it is null.
  /// [ThemeData.applyElevationOverlayColor], which turns elevation overlay on or off for dark themes.
  final Color? shadowColor;

  /// Defines the material's shape as well its shadow.
  ///
  /// If shape is non null, the [borderRadius] is ignored and the material's clip boundary and shadow are defined by the shape.
  ///
  /// A shadow is only displayed if the [elevation] is greater than zero.
  final ShapeBorder? shape;

  /// The color of the surface tint overlay applied to the material color to indicate elevation.
  ///
  /// Material Design 3 introduced a new way for some components to indicate their elevation by using a surface tint color overlay on top of the base material [color]. This overlay is painted with an opacity that is related to the [elevation] of the material.
  ///
  /// If [ThemeData.useMaterial3] is false, then this property is not used.
  ///
  /// If [ThemeData.useMaterial3] is true and [surfaceTintColor] is not null and not [Colors.transparent], then it will be used to overlay the base [color] with an opacity based on the [elevation].
  ///
  /// Otherwise, no surface tint will be applied.
  ///
  /// See also:
  ///
  /// [ThemeData.useMaterial3], which turns this feature on.
  /// [ElevationOverlay.applySurfaceTint], which is used to implement the tint.
  /// https://m3.material.io/styles/color/the-color-system/color-roles which specifies how the overlay is applied.
  final Color? surfaceTintColor;

  /// The typographical style to use for text within this material.
  final TextStyle? textStyle;

  final MaterialType type;

  /// The kind of material to show (e.g., card or canvas). This affects the shape of the widget, the roundness of its corners if the shape is rectangular, and the default color.

  const OpsShell({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.radius = 30,
    this.elevation = 20,
    this.alignment,
    this.backgroundDecoration,
    this.decoration,
    this.color,
    this.animationDuration = kThemeChangeDuration,
    this.borderOnForeground = true,
    this.clipBehavior = Clip.none,
    this.shadowColor,
    this.shape,
    this.surfaceTintColor,
    this.textStyle,
    this.type = MaterialType.canvas,
  }) : super(key: key);
  @override
  State<OpsShell> createState() => _OpsShellState();
}

class _OpsShellState extends State<OpsShell> {
  @override
  Widget build(BuildContext context) {
    String platform = PlatformCheck().platformCheck(context: context);
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: widget.alignment ?? Alignment.center,
      decoration: widget.backgroundDecoration,
      child: Container(
        margin: EdgeInsets.all(platform == Platforms.webDesktop ||
                platform == Platforms.windows ||
                platform == Platforms.webTablet
            ? 20
            : 0),
        child: Material(
          animationDuration: widget.animationDuration,
          borderOnForeground: widget.borderOnForeground,
          clipBehavior: widget.clipBehavior,
          shadowColor: widget.shadowColor,
          shape: widget.shape,
          surfaceTintColor: widget.surfaceTintColor,
          textStyle: widget.textStyle,
          type: widget.type,
          color: widget.color,
          elevation: widget.elevation,
          borderRadius: BorderRadius.circular(widget.radius),
          child: Container(
            height: (platform == Platforms.webDesktop ||
                    platform == Platforms.windows ||
                    platform == Platforms.webTablet
                ? widget.height
                : size.height),
            width: (platform == Platforms.webDesktop ||
                    platform == Platforms.windows ||
                    platform == Platforms.webTablet
                ? (widget.width ?? size.width * 0.35)
                : size.width),
            decoration: widget.decoration ??
                BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    platform == Platforms.webDesktop ||
                            platform == Platforms.windows ||
                            platform == Platforms.webTablet
                        ? widget.radius
                        : 0,
                  ),
                ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  platform == Platforms.webDesktop ||
                          platform == Platforms.windows ||
                          platform == Platforms.webTablet
                      ? widget.radius
                      : 0,
                ),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
