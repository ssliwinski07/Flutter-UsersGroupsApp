import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget.rectangular({
    super.key,
    required this.height,
    this.width = double.infinity,
    required this.borderShape,
  });

  const ShimmerLoadingWidget.circle({
    super.key,
    required this.height,
    required this.width,
  }) : borderShape = const CircleBorder();

  final double height;
  final double width;
  final ShapeBorder borderShape;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.grey[400],
          shape: borderShape,
        ),
      ),
    );
  }
}
