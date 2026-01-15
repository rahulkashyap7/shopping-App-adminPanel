import 'package:flutter/material.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class RLoginHeader extends StatelessWidget {
  const RLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(width: 100, height: 100, image: AssetImage
            (RImages.loginLogo)),
          const SizedBox(height: RSizes.spaceBtwSections),
          Text(RTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: RSizes.sm),
          Text(RTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}