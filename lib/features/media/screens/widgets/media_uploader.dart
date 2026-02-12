import 'package:ecommerce_admin_panel/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_admin_panel/common/widgets/images/R_rounded_image.dart';
import 'package:ecommerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:ecommerce_admin_panel/features/media/screens/widgets/folder_dropdown.dart';
import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get_x/get.dart';

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Obx(
      ()=> controller.showImageUploaderSection.value ? Column(
        children: [
          /// Drag and Drop Area
          RRoundedContainer(
            height: 250,
            showBorder: true,
            borderColor: RColors.borderPrimary,
            backgroundColor: RColors.primaryBackground,
            padding: EdgeInsets.all(RSizes.defaultSpace),
            child: Column(
              children: [
                Expanded(child: Stack(
                  alignment: Alignment.center,
                  children: [
                    DropzoneView(
                      mime: ['image/jpeg', 'image/png'],
                      cursor: CursorType.Default,
                      operation: DragOperation.copy,
                      onLoaded: () => print('Zone Loaded'),
                      onError: (ev) => print('Zone Error: $ev'),
                      onHover: () => print('Zone hovered'),
                      onLeave: () => print('Zone left'),
                      onCreated: (ctrl) => controller.dropzoneController = ctrl,
                      onDrop: (file) => print(file.name),
                      onDropInvalid: (ev) => print('Zone invalid MIME: $ev'),
                      onDropMultiple: (ev) => print('Zone drop multiple: $ev'),
                    ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(RImages.defaultMultiImageIcon, width: 50, height: 50),
                        const SizedBox(height: RSizes.spaceBtwItems),
                        Text('Drag and Drop Image here'),
                        SizedBox(height: RSizes.spaceBtwItems),
                        OutlinedButton(onPressed: (){}, child: Text('Select Images')),
                      ],
                    )
                  ],
                )),
              ],
            ),
          ),
          SizedBox(height: RSizes.spaceBtwItems),

          /// Locally Select Images
          RRoundedContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Folders Dropdown
                    Row(
                      children: [
                        // Folders dropdown
                        Text('Select Folder', style: Theme.of(context).textTheme.headlineSmall),
                        SizedBox(width: RSizes.spaceBtwItems),
                        MediaFolderDropdown(onChanged: (MediaCategory? newValue) {
                          if (newValue != null){
                            controller.selectedPath.value = newValue;
                          }
                        })
                      ],
                    ),

                    /// Upload and Remove Buttons
                    Row(
                      children: [
                        TextButton(onPressed: (){}, child: Text('Remove All')),
                        SizedBox(width: RSizes.spaceBtwItems),

                        RDeviceUtils.isMobileScreen(context) ? SizedBox.shrink() :
                        SizedBox(width: RSizes.buttonWidth, child: ElevatedButton(onPressed: (){}, child: Text('Upload'))),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: RSizes.spaceBtwSections),

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

                const SizedBox(height: RSizes.spaceBtwSections),
                RDeviceUtils.isMobileScreen(context) ? SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Upload'))) : SizedBox.shrink()
              ],
            ),
          ),
          const SizedBox(height: RSizes.spaceBtwSections),
        ]
      )
      : SizedBox.shrink(),
    );
  }
}
