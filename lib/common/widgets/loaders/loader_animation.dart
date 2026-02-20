import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RLoaderAnimation extends StatelessWidget {
  const RLoaderAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(RImages.defaultLoaderAnimation, height: 200, width: 200));
  }
}
