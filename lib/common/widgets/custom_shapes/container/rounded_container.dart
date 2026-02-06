import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class RRoundedContainer extends StatelessWidget {
  const RRoundedContainer({super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding = const EdgeInsets.all(RSizes.md),
    this.showShadow = true,
    this.showBorder = false,
    this.radius = RSizes.cardRadiusLg,
    this.backgroundColor = RColors.white,
    this.borderColor = RColors.borderPrimary,
    this.onTap,
  });

  final Widget? child;
  final double radius;
  final double? width;
  final double? height;
  final bool showBorder;
  final bool showShadow;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: borderColor) : null,
          boxShadow: [
            if (showShadow)
              BoxShadow(
                color: RColors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: child,
      ),
    );
  }
}
