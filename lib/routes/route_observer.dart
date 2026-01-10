import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_x/get.dart';

class RouteObserver extends GetObserver {

  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SidebarController());

    if (previousRoute != null) {
      // Check the route name and update the active item in the sidebar accordingly

      if (var routeName in RRoutes.sideMenuItems) {
        if (previousRoute.settings.name == routeName) {
          sidebarController.activeItem.value = routeName;
        }
      }
    }
  }

  @override
  void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SidebarController());

    if (route != null) {
      // Check the route name and update the active item in the sidebar accordingly
      for (var routeName in RRoutes.sideMenuItems) {
        if (route.settings.name == routeName) {
          sidebarController.activeItem.value = routeName;
        }
      }
    }
  }
}