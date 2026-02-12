import 'package:ecommerce_admin_panel/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/images/R_rounded_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import 'folder_dropdown.dart';

class MediaContent extends StatelessWidget {
  const MediaContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return RRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Media images header
          Row(
            children: [
              // Folders dropdown
              Text('Select Folder', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(width: RSizes.spaceBtwItems),
              MediaFolderDropdown(onChanged: (MediaCategory? newValue) {
                if (newValue != null){
                  controller.selectedPath.value = newValue;
                }
              })
            ],
          ),
          const SizedBox(height: RSizes.spaceBtwSections),

          /// Show Media

          Wrap(
            alignment: WrapAlignment.start,
            spacing: RSizes.spaceBtwItems / 2,
            runSpacing: RSizes.spaceBtwItems / 2,
            children: [
              RRoundedImage(
                width: 90,
                height: 90,
                padding: RSizes.sm,
                imageType: ImageType.asset,
                image: RImages.adidas,
                backgroundColor: RColors.primaryBackground,
              ),
              RRoundedImage(
                width: 90,
                height: 90,
                padding: RSizes.sm,
                imageType: ImageType.asset,
                image: RImages.adidas,
                backgroundColor: RColors.primaryBackground,
              ),
              RRoundedImage(
                width: 90,
                height: 90,
                padding: RSizes.sm,
                imageType: ImageType.asset,
                image: RImages.adidas,
                backgroundColor: RColors.primaryBackground,
              ),
              RRoundedImage(
                width: 90,
                height: 90,
                padding: RSizes.sm,
                imageType: ImageType.asset,
                image: RImages.adidas,
                backgroundColor: RColors.primaryBackground,
              ),
              RRoundedImage(
                width: 90,
                height: 90,
                padding: RSizes.sm,
                imageType: ImageType.asset,
                image: RImages.adidas,
                backgroundColor: RColors.primaryBackground,
              ),
            ],
          ),

          /// Load More Media Button
          Padding(
            padding: EdgeInsets.symmetric(vertical: RSizes.spaceBtwSections),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: RSizes.buttonWidth,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: Text('Load More'),
                    icon: Icon(Iconsax.arrow_down),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
