import 'package:ecommerce_admin_panel/app.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/routes/routes_middleware.dart';
import 'package:get_x/get_navigation/src/routes/get_route.dart';

class RAppRoute {
  static final List<GetPage> pages = [
    GetPage(name: RRoutes.firstScreen, page: () => const ResponsiveDesignScreen(), middlewares:
    [RRouteMiddleware()]),
    // GetPage(name: RRoutes.secondScreen, page: () => const SecondScreen(), middlewares: [RRouteMiddleware()]),
    // GetPage(name: RRoutes.secondScreenWithUID, page: () => const SecondScreen()),


    // GetPage(name: RRoutes.login, page: () => const LoginScreen()),
    // GetPage(name: RRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    // GetPage(name: RRoutes.resetPassword, page: () => const ResetPasswordScreen()),
    // GetPage(name: RRoutes.dashboard, page: () => const DashboardScreen(), middlewares: [RRouteMiddleware()]),
    // GetPage(name: RRoutes.media, page: () => const MediaScreen(), middlewares:
    // [RRouteMiddleware()]),
    //
    // // Banners
    // GetPage(name: RRoutes.banners, page: () => const BannersScreen(), middlewares: [RRouteMiddleware()]),
    // GetPage(name: RRoutes.createBanner, page: () => const CreateBannerScreen(), middlewares: [RRouteMiddleware()]),
    // GetPage(name: RRoutes.editBanner, page: () => const EditBannerScreen(), middlewares: [RRouteMiddleware()]),
    //
    // // Products
    // GetPage(name: RRoutes.products, page: () => const ProductsScreen(), middlewares: [RRouteMiddleware()]),
    // GetPage(name: RRoutes.createProduct, page: () => const CreateProductScreen(), middlewares: [RRouteMiddleware()]),
    // GetPage(name: RRoutes.editProduct, page: () => const EditProductScreen(), middlewares: [RRouteMiddleware()]),
    //
    // // Categories
    // GetPage(name: RRoutes.categories, page: () => const CategoriesScreen(), middlewares: [RRouteMiddleware()]),
    // GetPage(name: RRoutes.createCategories, page: () => constCreateCategoryScreen(), middlewares: [RRouteMiddleware()]),
    // GetPage(name: RRoutes.editCategories, page: () => EditCategoryScreen(), middlewares: [RRouteMiddleware()]),
    //
    // // Brands
    // GetPage(name: RRoutes.brands, page: () => const BrandsScreen(), middlewares: [RRouteMiddleware()]),
    // GetPage(name: RRoutes.createBrand, page: () => const CreateBrandsScreen(), middlewares: [RRouteMiddleware()]),
    // GetPage(name: RRoutes.editBrand, page: () => const EditBrandsScreen(), middlewares: [RRouteMiddleware()]),
  ];
}