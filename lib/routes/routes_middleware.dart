import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_x/get.dart';

class RRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final isAuthenticated = false;
    return isAuthenticated
        ? null
        : const RouteSettings(name: RRoutes.firstScreen);
  }
}
