import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:get_x/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class RLoginForm extends StatelessWidget {
  const RLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
        EdgeInsets.symmetric(vertical: RSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: RTexts.email),
            ),
            SizedBox(height: RSizes.spaceBtwInputFields),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: RTexts.password,
                suffixIcon: IconButton(onPressed: (){}, icon: Icon(Iconsax.eye_slash)),
              ),
            ),
            SizedBox(height: RSizes.spaceBtwInputFields / 2),

            /// Remember Me and Forget Password Button
            Row(
              children: [
                /// Remember me
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(value: true, onChanged: (value){}),
                    Text(RTexts.rememberMe),
                  ],
                ),

                /// Forget Password
                TextButton(onPressed: () => Get.toNamed(RRoutes.forgetPassword), child:
                Text(RTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: RSizes.spaceBtwSections),

            /// Sign In button
            SizedBox(width: double.infinity,
              child: ElevatedButton(onPressed: (){}, child: Text(RTexts.logIn)),
            )
          ],
        ),
      ),
    );
  }
}