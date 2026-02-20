import 'package:ecommerce_admin_panel/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_admin_panel/common/widgets/images/R_rounded_image.dart';
import 'package:ecommerce_admin_panel/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get_core/src/get_main.dart';
import 'package:get_x/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:web/web.dart' hide Text;
import 'package:clipboard/clipboard.dart';
import '../../models/image_model.dart';

class ImagePopup extends StatelessWidget {
  // The image model to display detailed information about.
  final ImageModel image;

  // Constructor for the ImagePopup class.
  const ImagePopup({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        // Define the shape of the dialog.
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RSizes.borderRadiusLg)),
        child: RRoundedContainer(
          // Set the width of the rounded container based on the screen size.
          width: RDeviceUtils.isDesktopScreen(context)
              ? MediaQuery.of(context).size.width * 0.4
              : double.infinity,
          padding: const EdgeInsets.all(RSizes.spaceBtwItems),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Stack(
                  children: [
                    // Display the image with rounded container
                    RRoundedContainer(
                      backgroundColor: RColors.primaryBackground,
                      child: RRoundedImage(
                        image: image.url,
                        applyImageRadius: true,
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: RDeviceUtils.isDesktopScreen(context)
                            ? MediaQuery.of(context).size.height * 0.4
                            : double.infinity,
                        imageType: ImageType.network,
                      ),
                    ),
                    // close icon button at the top-right corner.
                    Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                            onPressed: () => Get.back(),
                            icon: Icon(Iconsax.close_circle))),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: RSizes.spaceBtwItems),

              // Display various material about this image.
              // Include image name, path, type, size, creation date, and URL.
              // Also provides an option to copy the image URL.
              Row(
                children: [
                  Expanded(
                      child: Text('Image Name:',
                          style: Theme.of(context).textTheme.bodyLarge)),
                  Expanded(
                      flex: 3,
                      child: Text(image.filename,
                          style: Theme.of(context).textTheme.titleLarge)),
                ],
              ),

              // Display the image URL an option to copy it.
              Row(
                children: [
                  Expanded(
                      child: Text('Image URL:',
                          style: Theme.of(context).textTheme.bodyLarge)),
                  Expanded(
                      flex: 2,
                      child: Text(image.url,
                          style: Theme.of(context).textTheme.titleLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis)),
                  Expanded(
                      child: OutlinedButton(
                    onPressed: () {
                      FlutterClipboard.copy(image.url).then((value) =>
                          RLoaders.customToast(message: 'URL Copied!'));
                    },
                    child: Text('Copy URL'),
                  ))
                ],
              ),
              const SizedBox(height: RSizes.spaceBtwSections),

              // Display a button to delete the image.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextButton(
                        onPressed: () {},
                        child: Text('Delete Image',
                            style: TextStyle(color: Colors.red))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
