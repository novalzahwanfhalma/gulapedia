import 'package:flutter/material.dart';

class FloatingContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;
  final Widget? child;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;

  const FloatingContainer({
    super.key,
    this.width,
    this.height,
    this.color = Colors.white,
    this.child,
    this.borderRadius = 12,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: const Color.fromRGBO(0, 0, 0, 0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(4, 4),
              ),
            ],
      ),
      child: child,
    );
  }
}
