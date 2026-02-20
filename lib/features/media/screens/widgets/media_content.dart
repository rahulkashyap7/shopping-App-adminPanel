import 'package:ecommerce_admin_panel/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_admin_panel/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_admin_panel/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:ecommerce_admin_panel/features/media/models/image_model.dart';
import 'package:ecommerce_admin_panel/features/media/screens/widgets/view_image_details.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/images/R_rounded_image.dart';
import '../../../../common/widgets/loaders/loader_animation.dart';
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
                  controller.getMediaImages();
                }
              })
            ],
          ),
          const SizedBox(height: RSizes.spaceBtwSections),

          /// Show Media

          Obx(
            () {
              // Get Selected Folder Images
              List<ImageModel> images = _getSelectedFolderImages(controller);

              //Loader
              if (controller.loading.value && images.isEmpty) return const RLoaderAnimation();

              // Empty Widget
              if (images.isEmpty) return _buildEmptyAnimationWidget(context);

              return Column(
                mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: images.map((image) => GestureDetector(
                    onTap: () => Get.dialog(ImagePopup(image: image)),
                    child: SizedBox(
                      width: 140,
                      height: 180,
                      child: Column(
                        children: [
                          _buildSimpleList(image),
                          Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: RSizes.sm),
                          child: Text(image.filename, maxLines: 1, overflow: TextOverflow.ellipsis),
                          ),
                          ),
                        ],
                      ),
                    ),
                  )).toList(),
                ),

                /// Load More Media Button
                if (!controller.loading.value)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: RSizes.spaceBtwSections),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: RSizes.buttonWidth,
                        child: ElevatedButton.icon(
                          onPressed: () => controller.loadMoreMediaImages(),
                          label: Text('Load More'),
                          icon: Icon(Iconsax.arrow_down),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
            },
          ),


        ],
      ),
    );
  }

}

List<ImageModel> _getSelectedFolderImages(MediaController controller) {
  List<ImageModel> images = [];
  if (controller.selectedPath.value == MediaCategory.banners){
    images = controller.allBannerImages.where((images) => images.url.isNotEmpty).toList();
  } else if (controller.selectedPath.value == MediaCategory.brands) {
    images = controller.allBrandImages.where((images) => images.url.isNotEmpty).toList();
  } else if (controller.selectedPath.value == MediaCategory.categories) {
    images = controller.allCategoryImages.where((images) => images.url.isNotEmpty).toList();
  } else if (controller.selectedPath.value == MediaCategory.products) {
    images = controller.allProductImages.where((images) => images.url.isNotEmpty).toList();
  } else if (controller.selectedPath.value == MediaCategory.users) {
    images = controller.allUserImages.where((images) => images.url.isNotEmpty).toList();
  }
  return images;
}

Widget _buildEmptyAnimationWidget(BuildContext context) {
  return Padding(padding: EdgeInsets.symmetric(vertical: RSizes.lg * 3),
    child: RAnimationLoaderWidget(
      width: 300,
      height: 300,
      text: 'Select your Desired Folder',
      animation: RImages.packageAnimation,
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}

Widget _buildSimpleList(ImageModel image) {
  return RRoundedImage(
    width: 140,
    height: 140,
    padding: RSizes.sm,
    image: image.url,
    imageType: ImageType.network,
    margin: RSizes.spaceBtwItems / 2,
    backgroundColor: RColors.primaryBackground,
  );
}
