import 'package:ecommerce_admin_panel/features/authentication/controllers/user_controller.dart';
import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:ecommerce_admin_panel/utils/popups/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../images/R_rounded_image.dart';

class RHeader extends StatelessWidget implements PreferredSizeWidget {
  const RHeader({super.key, required this.scaffoldKey});

  /// GlobalKey to access the Scaffold state
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Container(
      decoration: BoxDecoration(
        color: RColors.white,
        border: Border(bottom: BorderSide(color: RColors.grey, width: 1)),
      ),
      padding: EdgeInsets.symmetric(horizontal: RSizes.md,vertical: RSizes.sm),
      child: AppBar(
        /// Mobile Menu
        leading: !RDeviceUtils.isDesktopScreen(context) ? IconButton
          (onPressed: () => scaffoldKey?.currentState?.openDrawer(), icon:
        Icon(Iconsax
            .menu)) : null,

        /// Search Field
        title: RDeviceUtils.isDesktopScreen(context) ? SizedBox(
          width: 400,
          child: TextFormField(
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.search_normal), hintText: 'Search anything...'),
          ),
        ) : null,

        /// Actions
        actions: [
          if(!RDeviceUtils.isDesktopScreen(context)) IconButton(icon: Icon(Iconsax.search_normal), onPressed: (){}),

          IconButton(icon: Icon(Iconsax.notification), onPressed: () {}),
          const SizedBox(width: RSizes.spaceBtwItems / 2),

          // User Data
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                ()=> RRoundedImage(
                    width: 40,
                    padding: 2,
                    height: 40,
                    imageType: controller.user.value.profilePicture.isNotEmpty ? ImageType.network :ImageType.asset,
                    image: controller.user.value.profilePicture.isNotEmpty ? controller.user.value.profilePicture : RImages.userPic,
                ),
              ),
              SizedBox(width: RSizes.sm),

              // Name and Email
              if (!RDeviceUtils.isMobileScreen(context))
              Obx(
                ()=> Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.loading.value ? const RShimmerEffect(width: 50, height: 13) :
                    Text(controller.user.value.fullName, style: Theme.of(context).textTheme.titleLarge),
                    controller.loading.value ? const RShimmerEffect(width: 50, height: 13) :
                    Text(controller.user.value.email, style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(RDeviceUtils.getAppBarHeight() + 15);
}
