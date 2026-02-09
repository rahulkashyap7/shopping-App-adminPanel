import 'package:ecommerce_admin_panel/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_admin_panel/features/shop/controllers/dashboard/dashboard_controller.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/helpers/helper_function.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../utils/constants/enums.dart';

class OrderStatusPieChart extends StatelessWidget {
  const OrderStatusPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DashboardController.instance;
    return RRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Status', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: RSizes.spaceBtwSections),

          // Graph
          SizedBox(
            height: 400,
            child: PieChart(PieChartData(
              sections: controller.orderStatusData.entries.map((entry) {
                final status = entry.key;
                final count = entry.value;

                return PieChartSectionData(
                  title: count.toString(),
                  radius: 100,
                  value: count.toDouble(),
                  color: RHelperFunctions.getOrdersStatusColor(status),
                  titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                );

              }).toList(),
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse){
                  // Handle touch event here if needed
                },
                enabled: true,
              )
            )),
          ),

          // Show Status and color meta
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Orders')),
                DataColumn(label: Text('Total')),
              ],
              rows: controller.orderStatusData.entries.map((entry){
                final OrderStatus status = entry.key;
                final int count = entry.value;
                final totalAmount = controller.totalAmount[status] ?? 0;

                return DataRow(cells: [
                  DataCell(Row(
                    children: [
                      RCircularContainer(width: 20, height: 20, backgroundColor: RHelperFunctions.getOrdersStatusColor(status)),
                      Expanded(child: Text(' ${controller.getDisplayStatusName(status)}')),
                    ],
                  )),
                  DataCell(Text(count.toString())),
                  DataCell(Text('\$${totalAmount.toStringAsFixed(2)}')),
                ]);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
