import 'package:ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ecommerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:ecommerce_admin_panel/features/media/screens/widgets/media_content.dart';
import 'package:ecommerce_admin_panel/features/media/screens/widgets/media_uploader.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get_core/src/get_main.dart';
import 'package:get_x/get_instance/src/extension_instance.dart';
import 'package:iconsax/iconsax.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Breadcrumbs
                const RBreadcrumbWithHeading(heading: 'Media', breadcrumbItems: [RRoutes.login, 'Media Screen']),

                SizedBox(
                  width: RSizes.buttonWidth * 1.5,
                  child: ElevatedButton.icon(
                    onPressed: () => controller.showImageUploaderSection.value = !controller.showImageUploaderSection.value,
                    icon: const Icon(Iconsax.cloud_add),
                    label: Text('Upload Images'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: RSizes.spaceBtwSections),

            /// Upload Area
            MediaUploader(),

            /// Media
            MediaContent(),
          ],
        ),
        ),
      ),
    );
  }
}
