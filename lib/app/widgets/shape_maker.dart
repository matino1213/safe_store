import 'package:flutter/material.dart';

class ShapeMaker extends StatelessWidget {
  const ShapeMaker({
    super.key,
    this.top,
    this.bottom,
    this.right,
    this.left,
    required this.height,
    required this.width,
    required this.color,
    this.shape = BoxShape.rectangle,
  });

  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  final double height;
  final double width;
  final Color color;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      height: height,
      width: width,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: shape,
        ),
      ),
    );
  }
}
