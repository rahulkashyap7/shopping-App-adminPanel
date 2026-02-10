import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin_panel/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_admin_panel/features/shop/controllers/dashboard/dashboard_controller.dart';
import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get.dart';

class OrderRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    final order = DashboardController.orders[index];
    return DataRow2(cells: [
      DataCell(
      Text(
        order.id,
        style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: RColors.primary),
      ),
    ),
      DataCell(Text(order.formattedOrderDate)),
      const DataCell(Text('5')),
      DataCell(
        RRoundedContainer(
          radius: RSizes.cardRadiusSm,
          padding: const EdgeInsets.symmetric(vertical: RSizes.xs, horizontal: RSizes.md),
          backgroundColor: RHelperFunctions.getOrdersStatusColor(order.status).withOpacity(0.1),
          child: Text(
            order.status.name.capitalize.toString(),
            style: TextStyle(color: RHelperFunctions.getOrdersStatusColor(order.status)),
          ),
        ),
      ),
      DataCell(Text('\$${order.totalAmount}')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => DashboardController.orders.length;

  @override
  int get selectedRowCount => 0;
  
}