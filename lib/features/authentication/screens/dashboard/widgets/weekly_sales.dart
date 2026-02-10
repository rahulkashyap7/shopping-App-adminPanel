import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get_core/src/get_main.dart';
import 'package:get_x/get_instance/src/extension_instance.dart';
import 'package:get_x/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../shop/controllers/dashboard/dashboard_controller.dart';

class WeeklySalesGraph extends StatelessWidget {
  const WeeklySalesGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return RRoundedContainer(
      child: Column(
        children: [
          Text('Weekly Sales',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: RSizes.spaceBtwSections),

          // Graph
          Obx(
            () => SizedBox(
              height: 400,
              child: BarChart(BarChartData(
                  titlesData: buildFlTitlesData(),
                  borderData: FlBorderData(
                      show: true,
                      border:
                          Border(top: BorderSide.none, right: BorderSide.none)),
                  gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      drawVerticalLine: true,
                      horizontalInterval: 200),
                  barGroups: controller.weeklySales
                      .asMap()
                      .entries
                      .map((entry) => BarChartGroupData(x: entry.key, barRods: [
                            BarChartRodData(
                              width: 30,
                              toY: entry.value,
                              color: RColors.primary,
                              borderRadius: BorderRadius.circular(RSizes.sm),
                            )
                          ]))
                      .toList(),
                  groupsSpace: RSizes.spaceBtwItems,
                  barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                          getTooltipColor: (_) => RColors.secondary),
                      touchCallback: RDeviceUtils.isDesktopScreen(context)
                          ? (barTouchEvent, barTouchResponse) {}
                          : null))),
            ),
          )
        ],
      ),
    );
  }

  FlTitlesData? buildFlTitlesData()  {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              // Map index to the desired day of the week
              final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

              // Calculate the index and ensure it wraps around for the correct day
              final index = value.toInt() % days.length;

              // Get the day corresponding to the calculate index
              final day = days[index];

              return SideTitleWidget(space: 0, meta: meta, child: Text(day));
            }),
      ),
      leftTitles: AxisTitles(
          sideTitles:
          SideTitles(showTitles: true, interval: 200, reservedSize: 50)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }
}
