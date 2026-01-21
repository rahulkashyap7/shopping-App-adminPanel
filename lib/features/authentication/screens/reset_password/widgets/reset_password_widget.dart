import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get_core/src/get_main.dart';
import 'package:get_x/get_navigation/src/extension_navigation.dart';

import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';


class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({super.key,
  });

  @override
  Widget build(BuildContext context) {
    final email = Get.parameters['email'] ?? '';
    return Column(
      children: [
        /// Header
        Row(
          children: [
            IconButton(onPressed: () => Get.offAllNamed(RRoutes.login), icon:
            Icon(CupertinoIcons.clear)),
          ],
        ),
        const SizedBox(height: RSizes.spaceBtwItems),

        /// Image
        Image(image: AssetImage(RImages.verifyEmail), width: 300, height: 300),
        const SizedBox(height: RSizes.spaceBtwItems),

        /// Title & Subtitle
        Text(RTexts.changeYourPasswordTitle, style: Theme.of(context)
            .textTheme.headlineMedium, textAlign: TextAlign.center),
        const SizedBox(height: RSizes.spaceBtwItems),
        Text(email, textAlign: TextAlign.center, style: Theme.of(context)
            .textTheme.labelLarge),
        const SizedBox(height: RSizes.spaceBtwItems),
        Text(
          RTexts.changeYourPasswordSubTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: RSizes.spaceBtwSections),

        /// Buttons
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () => Get.offAllNamed(RRoutes.login), child: Text
            (RTexts.done)),
        ),
        const SizedBox(height: RSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: TextButton(onPressed: () {}, child: Text(RTexts.resendEmail)),
        )

      ],
    );
  }
}