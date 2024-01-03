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

  const OpsShell({
    Key? key,
    this.child = const Center(child: Text("OpsShell")),
    this.height,
    this.width,
    this.radius = 30,
    this.elevation = 20,
    this.alignment,
    this.backgroundDecoration,
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
        margin: EdgeInsets.all(platform == Platforms.webDesktop || platform == Platforms.windows || platform == Platforms.webTablet ? 20 : 0),
        child: Material(
          elevation: widget.elevation,
          borderRadius: BorderRadius.circular(widget.radius),
          child: Container(
            height: (platform == Platforms.webDesktop || platform == Platforms.windows || platform == Platforms.webTablet ? widget.height : size.height),
            width:
                (platform == Platforms.webDesktop || platform == Platforms.windows || platform == Platforms.webTablet ? (widget.width ?? size.width * 0.35) : size.width),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(platform == Platforms.webDesktop || platform == Platforms.windows || platform == Platforms.webTablet ? widget.radius : 0),
            ),
            child: Center(
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(platform == Platforms.webDesktop || platform == Platforms.windows || platform == Platforms.webTablet ? widget.radius : 0),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
