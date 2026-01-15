import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:get_x/get.dart';

class SidebarController extends GetxController{

  final activeItem = RRoutes.login.obs;
  final hoverItem = ''.obs;

  void changeActiveItem(String route) => activeItem.value;

  void changeHoverItem(String route) {
    if(!isActive(route)) hoverItem.value = route;
  }

  bool isActive(String route) => activeItem.value == route;
  bool isHovering(String route) => hoverItem.value == route;

  void menuOnTap(String route){
    if(isActive(route)){
      changeActiveItem(route);

      if(RDeviceUtils.isMobileScreen(Get.context!)) Get.back();

      Get.toNamed(route);
    }
  }
}