import 'package:ecommerce_admin_panel/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:get_x/get_core/src/get_main.dart';
import 'package:get_x/get_instance/src/extension_instance.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class RMenuItem extends StatelessWidget {
  const RMenuItem({
    super.key, required this.route, required this.icon, required this.itemName,
  });

  final String route;
  final IconData icon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SidebarController());

    return InkWell(
      onTap: () => menuController.menuOnTap(route),
      onHover: (hovering) => hovering ? menuController.changeHoverItem(route)
          : menuController.changeHoverItem(''),
      child: Obx(
          () => Padding(
          padding: const EdgeInsets.symmetric(vertical: RSizes.xs),
          child: Container(
            decoration: BoxDecoration(
              color: menuController.isHovering(route) || menuController.isActive(route) ? RColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon
                Padding(
                  padding: const EdgeInsets.only(left: RSizes.lg, top: RSizes.md, bottom: RSizes.md, right: RSizes.md),
                  child: menuController.isActive(route) ? Icon(icon, size: 22, color: RColors.white) : Icon(icon, size: 22, color: menuController.isHovering(route) ? RColors.white : RColors.darkGrey),
                ),

                // Text
                if(menuController.isHovering(route) || menuController.isActive(route))
                Flexible(child: Text(itemName, style: Theme.of(context).textTheme.bodyMedium!.apply(color: RColors.white)))
                else
                  Flexible(child: Text(itemName, style: Theme.of(context)
                      .textTheme.bodyMedium!.apply(color: RColors.darkerGrey))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}