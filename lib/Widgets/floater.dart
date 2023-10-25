import 'package:flutter/material.dart';

class Floater extends StatelessWidget {
  final Color? backgroundColor;
  final double? elevation;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  const Floater({
    Key? key,
    this.backgroundColor,
    this.elevation,
    this.margin,
    this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(10),
      padding: padding ?? const EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor ?? Colors.white,
        elevation: elevation ?? 10,
        child: child,
      ),
    );
  }
}
