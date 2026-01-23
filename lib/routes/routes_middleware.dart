import 'package:ecommerce_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_x/get.dart';

class RRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthenticationRepository.instance.isAuthenticated ? null : RouteSettings(name: RRoutes.login);
  }
}
