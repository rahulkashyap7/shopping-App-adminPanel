import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:get_x/get_navigation/src/routes/get_route.dart';
import '../features/authentication/screens/login/login.dart';

class RAppRoute {
  static final List<GetPage> pages = [
    GetPage(name: RRoutes.login, page: () => const LoginScreen()),
    ];
}