import 'package:ecommerce_admin_panel/utils/helpers/helper_function.dart';
import 'package:get_x/get.dart';
import '../../../../utils/constants/enums.dart';
import '../../models/order_model.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  final RxList<double> weeklySales = <double>[].obs;

  /// Orders
  static final List<OrderModel> orders = [
    // Dummy Order Data
    OrderModel(
        id: 'CWT0012',
        status: OrderStatus.processing,
        totalAmount: 265,
        orderDate: DateTime.now().subtract(const Duration(days: 0)), // Today
        deliveryDate: DateTime.now().add(const Duration(days: 2))),
    OrderModel(
        id: 'CWT0025',
        status: OrderStatus.shipped,
        totalAmount: 369,
        orderDate:
            DateTime.now().subtract(const Duration(days: 1)), // Yesterday
        deliveryDate: DateTime.now().add(const Duration(days: 1))),
    OrderModel(
        id: 'CWT0030',
        status: OrderStatus.delivered,
        totalAmount: 1001,
        orderDate: DateTime.now().subtract(const Duration(days: 2)),
        deliveryDate: DateTime.now()),
    OrderModel(
        id: 'CWT0031',
        status: OrderStatus.processing,
        totalAmount: 499,
        orderDate: DateTime.now().subtract(const Duration(days: 3)),
        deliveryDate: DateTime.now()),
    OrderModel(
        id: 'CWT0040',
        status: OrderStatus.delivered,
        totalAmount: 115,
        orderDate: DateTime.now().subtract(const Duration(days: 4)),
        deliveryDate: DateTime.now()),
  ];

  @override
  void onInit() {
    _calculateWeeklySales();
    super.onInit();
  }

  // Calculate weekly sales
  void _calculateWeeklySales() {
    // Reset weekly sales to zero
    weeklySales.value = List<double>.filled(7, 0.0);

    for (var order in orders) {
      final DateTime orderWeekStart =
          RHelperFunctions.getStartOfWeek(order.orderDate);

      //  Check of the order is within the current week
      if (orderWeekStart.isBefore(DateTime.now()) &&
          orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderDate.weekday - 1) % 7;

        // Ensure the index is non-negative
        index = index < 0 ? index + 7 : index;

        weeklySales[index] += order.totalAmount;
      }
    }

    print('Weekly Sale: $weeklySales');
  }
}
