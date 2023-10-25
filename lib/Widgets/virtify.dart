import 'dart:ui';
import 'package:flutter/material.dart';

/// When wrapped with [Vitrify] widget it converts the look of the widget to glass card look.
///
/// If the look is not as you expected then turn the color of your widget i.e. [child] to [Colors.transparent]
/// then it shall work as expected.
class Vitrify extends StatelessWidget {
  /// [child] as a widget for [Vitrify].
  final Widget child;

  /// [opacity] value will determine how clear will the filter look.
  final double opacity;

  /// [radius] BorderRadius for the corners.
  final BorderRadius? radius;

  /// [color] background color.
  final Color color;

  const Vitrify({
    Key? key,
    required this.child,
    this.opacity = .4,
    this.radius,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(5),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(color: color.withOpacity(opacity), child: child),
      ),
    );
  }
}
