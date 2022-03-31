import 'package:flutter/material.dart';

class Floater extends StatelessWidget {
  final Widget widget;
  const Floater({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Material(borderRadius: BorderRadius.circular(10), color: Colors.white, elevation: 10, child: widget),
    );
  }
}
