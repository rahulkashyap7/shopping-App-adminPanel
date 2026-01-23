import 'package:ecommerce_admin_panel/features/authentication/screens/reset_password/widgets/reset_password_widget.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreenMobile extends StatelessWidget {
  const ForgetPasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: ResetPasswordWidget(),
      )),
    );
  }
}
