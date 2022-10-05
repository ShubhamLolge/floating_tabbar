import 'package:flutter/material.dart';

class Floater extends StatelessWidget {
  final Color? backgroundColor;
  final double? elevation;
  final EdgeInsetsGeometry? margin;
  final Widget child;
  const Floater({
    Key? key,
    this.backgroundColor,
    this.elevation,
    this.margin,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return Container(
      margin: margin ?? const EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor ?? (brightness == Brightness.dark ? Colors.black : Colors.white),
        elevation: elevation ?? 10,
        child: child,
      ),
    );
  }
}
