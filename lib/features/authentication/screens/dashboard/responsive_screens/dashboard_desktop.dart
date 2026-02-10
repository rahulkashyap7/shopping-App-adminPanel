import 'package:ecommerce_admin_panel/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_admin_panel/features/authentication/screens/dashboard/table/data_table.dart';
import 'package:ecommerce_admin_panel/features/authentication/screens/dashboard/widgets/order_status_graph.dart';
import 'package:ecommerce_admin_panel/features/authentication/screens/dashboard/widgets/weekly_sales.dart';
import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../widgets/dashboard_card.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColors.primaryBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              Text('Dashboard',
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: RSizes.spaceBtwSections),

              /// Cards
              const Row(
                children: [
                  Expanded(
                      child: RDashboardCard(
                          title: 'Sales Total',
                          subTitle: '\$365.6',
                          stats: 25)),
                  SizedBox(width: RSizes.spaceBtwItems),
                  Expanded(
                      child: RDashboardCard(
                          title: 'Average Order Value',
                          subTitle: '\$25',
                          stats: 15)),
                  SizedBox(width: RSizes.spaceBtwItems),
                  Expanded(
                      child: RDashboardCard(
                          title: 'Total Orders', subTitle: '36', stats: 44)),
                  SizedBox(width: RSizes.spaceBtwItems),
                  Expanded(
                      child: RDashboardCard(
                          title: 'Visitors', subTitle: '25,035', stats: 2)),
                ],
              ),
              SizedBox(height: RSizes.spaceBtwSections),

              /// Graphs
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        /// Bar Graph
                        WeeklySalesGraph(),
                        SizedBox(height: RSizes.spaceBtwSections),

                        /// Orders
                        RRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Recent Order', style: Theme.of(context).textTheme.headlineSmall),
                              const SizedBox(height: RSizes.spaceBtwSections),
                              const DashboardOrderTable(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: RSizes.spaceBtwSections),

                  /// Pie Chart
                  Expanded(child: OrderStatusPieChart()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
