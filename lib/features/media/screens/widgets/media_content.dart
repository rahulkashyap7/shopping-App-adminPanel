import 'package:ecommerce_admin_panel/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_admin_panel/common/widgets/loaders/animation_loader.dart';
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
  MediaContent(
      {super.key,
      this.allowSelection = false,
      this.allowMultipleSelection = false,
      this.alreadySelectedUrls,
      this.onImageSelected});

  final bool allowSelection;
  final bool allowMultipleSelection;
  final List<String>? alreadySelectedUrls;
  final List<ImageModel> selectedImages = [];
  final Function(List<ImageModel> selectedImages)? onImageSelected;

  @override
  Widget build(BuildContext context) {
    bool loadedPreviousSelection = false;
    final controller = MediaController.instance;
    return RRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Media images header
          Row(
            children: [
              Row(
                children: [
                  // Folders dropdown
                  Text('Select Folder',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(width: RSizes.spaceBtwItems),
                  MediaFolderDropdown(onChanged: (MediaCategory? newValue) {
                    if (newValue != null) {
                      controller.selectedPath.value = newValue;
                      controller.getMediaImages();
                    }
                  })
                ],
              ),
              if (allowSelection) buildAddSelectedImageButton(),
            ],
          ),
          const SizedBox(height: RSizes.spaceBtwSections),

          /// Show Media

          Obx(
            () {
              // Get Selected Folder Images
              List<ImageModel> images = _getSelectedFolderImages(controller);

              // Load selected Images from the Already selected images only once otherwise
              // on Obx() rebuild UI first images will be selected the will auto un check.
              if(!loadedPreviousSelection) {
                if (alreadySelectedUrls != null && alreadySelectedUrls!.isNotEmpty){
                  // Convert alreadySelectedUrls to a Set for faster lookup
                  final selectedUrlsSet = Set<String>.from(alreadySelectedUrls!);

                  for (var image in images) {
                    image.isSelected.value = selectedUrlsSet.contains(image.url);
                    if (image.isSelected.value) {
                      selectedImages.add(image);
                    }
                  }

                } else {
                  // If alreadySelectedUrls is null or Empty, set all image to not selected
                  for (var image in images) {
                    image.isSelected.value = false;
                  }
                }
                loadedPreviousSelection = true;
              }

              //Loader
              if (controller.loading.value && images.isEmpty) {
                return const RLoaderAnimation();
              }

              // Empty Widget
              if (images.isEmpty) return _buildEmptyAnimationWidget(context);

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: images
                        .map((image) => GestureDetector(
                              onTap: () => showDialog(
                                  context: context,
                                  builder: (_) => ImagePopup(image: image)),
                              child: SizedBox(
                                width: 140,
                                height: 180,
                                child: Column(
                                  children: [
                                       allowSelection ? _buildListWithCheckbox(image) : _buildSimpleList(image),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: RSizes.sm),
                                        child: Text(image.filename, maxLines: 1, overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),

                  /// Load More Media Button
                  if (!controller.loading.value)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: RSizes.spaceBtwSections),
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

  List<ImageModel> _getSelectedFolderImages(MediaController controller) {
    List<ImageModel> images = [];
    if (controller.selectedPath.value == MediaCategory.banners) {
      images = controller.allBannerImages
          .where((images) => images.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.brands) {
      images = controller.allBrandImages
          .where((images) => images.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.categories) {
      images = controller.allCategoryImages
          .where((images) => images.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.products) {
      images = controller.allProductImages
          .where((images) => images.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.users) {
      images = controller.allUserImages
          .where((images) => images.url.isNotEmpty)
          .toList();
    }
    return images;
  }

  Widget _buildEmptyAnimationWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: RSizes.lg * 3),
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

  Widget _buildListWithCheckbox(ImageModel image) {
    return Stack(
      children: [
        RRoundedImage(
          width: 140,
          height: 140,
          padding: RSizes.sm,
          image: image.url,
          imageType: ImageType.network,
          margin: RSizes.spaceBtwItems / 2,
          backgroundColor: RColors.primaryBackground,
        ),
        Positioned(
          top: RSizes.md,
          right: RSizes.md,
          child: Obx(
            () => Checkbox(
                value: image.isSelected.value,
                onChanged: (selected) {
                  if (selected != null) {
                    image.isSelected.value = selected;

                    if (selected) {
                      if (!allowMultipleSelection) {
                        // If multiple selection is now allowed, uncheck other checkboxes
                        for (var otherImage in selectedImages) {
                          if (otherImage != image) {
                            otherImage.isSelected.value = false;
                          }
                        }
                        selectedImages.clear();
                      }

                      selectedImages.add(image);
                    } else {
                      selectedImages.remove(image);
                    }
                  }
                }),
          ),
        )
      ],
    );
  }

  Widget buildAddSelectedImageButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Close button
        SizedBox(
          width: 120,
          child: OutlinedButton.icon(
              label: Text('Close'),
              icon: Icon(Iconsax.close_circle),
              onPressed: () => Get.back()),
        ),
        const SizedBox(width: RSizes.spaceBtwItems),
        SizedBox(
          width: 120,
          child: ElevatedButton.icon(
              label: Text('Add'),
              icon: Icon(Iconsax.image),
              onPressed: () => Get.back(result: selectedImages)),
        )
      ],
    );
  }
}
