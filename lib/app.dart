import 'package:ecommerce_admin_panel/bindings/general_bindings.dart';
import 'package:ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:ecommerce_admin_panel/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: RTexts.appName,
      themeMode: ThemeMode.light,
      theme: RAppTheme.lightTheme,
      darkTheme: RAppTheme.darkTheme,
      getPages: RAppRoute.pages,
      initialBinding: GeneralBindings(),
      initialRoute: RRoutes.login,
      unknownRoute: GetPage(
          name: '/page-not-found',
          page: () => Scaffold(body: Center(child: Text('Page Not Found')))),
    );
  }
}
