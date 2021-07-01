import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget.rectangular({
    Key key,
    this.width = double.infinity,
    this.height})
      : this.shapeBorder = const RoundedRectangleBorder();
  const ShimmerWidget.circular({
    Key key,
    this.width,
    this.height,
    this.shapeBorder = const CircleBorder()}) : super(key: key);

  final  double width;
  final  double height;
  final ShapeBorder shapeBorder;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500],
      highlightColor: Colors.grey[300],
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.grey,
          shape: shapeBorder
        ),

      ),
    );
  }
}
