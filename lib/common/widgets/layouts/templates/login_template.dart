import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/helpers/helper_function.dart';
import 'package:ecommerce_admin_panel/utils/spacing_style/spacing_style.dart';
import 'package:flutter/cupertino.dart';

class RLoginTemplate extends StatelessWidget {
  const RLoginTemplate({super.key, required this.child});

  /// The widget to be displayed inside the login template
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Container(
            padding: RSpacingStyle.paddingWithAppBarHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RSizes.cardRadiusLg),
              color: RHelperFunctions.isDarkMode(context) ? RColors.black :
              RColors.white,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
