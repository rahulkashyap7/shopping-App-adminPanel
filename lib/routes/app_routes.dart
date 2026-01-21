import 'package:ecommerce_admin_panel/features/authentication/screens/forget_password/forget_password.dart';
import 'package:ecommerce_admin_panel/features/authentication/screens/reset_password/reset_password.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:get_x/get_navigation/src/routes/get_route.dart';
import '../features/authentication/screens/login/login.dart';

class RAppRoute {
  static final List<GetPage> pages = [
    GetPage(name: RRoutes.login, page: () => const LoginScreen()),
    GetPage(name: RRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: RRoutes.resetPassword, page: () => const ResetPasswordScreen()),
    ];
}