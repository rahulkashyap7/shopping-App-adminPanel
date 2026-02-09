import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';

class RCircularContainer extends StatelessWidget {
  const RCircularContainer({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.showBorder = false,
    this.backgroundColor = RColors.textWhite,
    this.borderColor = RColors.borderPrimary,
  });

  final Widget? child;
  final double? width;
  final double radius;
  final double? height;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}