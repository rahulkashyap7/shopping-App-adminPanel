import 'package:ecommerce_admin_panel/common/widgets/images/r_circular_image.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'menu/menu_item.dart';

class RSidebar extends StatelessWidget {
  const RSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
          color: RColors.white,
          border: Border(right: BorderSide(color: RColors.grey, width: 1)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Image
              RCircularImage(width: 100, height: 100, image: RImages.darkAppLogo, backgroundColor: Colors.transparent),
              SizedBox(height: RSizes.spaceBtwSections),
              Padding(
                padding: const EdgeInsets.all(RSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('MENU', style: Theme.of(context).textTheme
                        .bodySmall!.apply(letterSpacingDelta: 1.2)),

                    // MENU ITEMS
                    RMenuItem(route: RRoutes.firstScreen, icon: Iconsax.status, itemName: 'Dashboard'),
                    RMenuItem(route: RRoutes.secondScreen, icon: Iconsax.image, itemName: 'Media'),
                    RMenuItem(route: RRoutes.responsiveDesignTutorialScreen, icon: Iconsax.picture_frame, itemName: 'Banner',)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

