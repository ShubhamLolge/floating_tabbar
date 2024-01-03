import 'package:floating_tabbar/lib.dart';

class Floater extends StatelessWidget {
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? radius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  const Floater({
    Key? key,
    this.backgroundColor,
    this.elevation,
    this.radius,
    this.margin,
    this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: radius ?? BorderRadius.circular(10),
      color: backgroundColor ?? Colors.white,
      elevation: elevation ?? 10,
      child: Container(
        margin: margin ?? const EdgeInsets.all(5),
        padding: padding ?? const EdgeInsets.all(5),
        child: child,
      ),
    );
  }
}
