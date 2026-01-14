
class RRoutes {
  static const firstScreen = '/';
  static const secondScreen = '/second-screen/';
  static const secondScreenWithUID = '/second-screen/:userId';
  static const responsiveDesignTutorialScreen = '/responsive-design-tutorial/';

  static List sidebarMenuItems = [
    firstScreen, responsiveDesignTutorialScreen
  ];

  static const login = '/login';
  static const forgetPassword = '/forgetPassword';
  static const resetPassword = '/resetPassword';
  static const dashboard = '/dashboard';
  static const media = '/dashboard';

  static const banners = '/banners';
  static const createBanner = '/createBanners';
  static const editBanner = '/editBanner';

  static const products = '/products';
  static const createProduct = '/createProducts';
  static const editProduct = '/editProducts';

  static const categories = '/categories';
  static const createCategories = '/createCategories';
  static const editCategories = '/editCategories';

  static const brands = '/brands';
  static const createBrand = '/createBrand';
  static const editBrand = '/editBrand';

  static const customers = '/customers';
  static const createCustomers = '/createCustomers';
  static const customDetails = '/customDetails';

  static const orders = '/orders';
}