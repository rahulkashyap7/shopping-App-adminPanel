import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get_core/src/get_main.dart';
import 'package:get_x/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class HeaderAndForm extends StatelessWidget {
  const HeaderAndForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        IconButton(onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left)),
        const SizedBox(height: RSizes.spaceBtwItems),
        Text(RTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: RSizes.spaceBtwItems),
        Text(RTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: RSizes.spaceBtwSections * 2),

        /// Form
        Form(
          child: TextFormField(
            decoration: InputDecoration(
                labelText: RTexts.email,
                prefixIcon: Icon(Iconsax.direct_right)),
          ),
        ),
        const SizedBox(height: RSizes.spaceBtwSections),

        /// Submit Button
        SizedBox(width: double.infinity,
          child: ElevatedButton(onPressed: () => Get.toNamed(RRoutes
              .resetPassword, parameters: {'email': 'test@gmail.com'}), child: Text(RTexts
              .submit)),),
        const SizedBox(height: RSizes.spaceBtwSections * 2),
      ],
    );
  }
}