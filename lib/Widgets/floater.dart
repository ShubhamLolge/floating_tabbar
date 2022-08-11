import 'package:flutter/material.dart';

class Floater extends StatelessWidget {
  /// This is widget that will appear floating when wrapped with Floater
  final Widget child;
  const Floater({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Material(borderRadius: BorderRadius.circular(10), color: Colors.white, elevation: 10, child: child),
    );
  }
}
