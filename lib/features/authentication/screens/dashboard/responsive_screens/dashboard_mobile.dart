import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../utils/constants/sizes.dart';
import '../table/data_table.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/order_status_graph.dart';
import '../widgets/weekly_sales.dart';

class DashboardMobileScreen extends StatelessWidget {
  const DashboardMobileScreen({super.key});

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
              // Heading
              Text('Dashboard', style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: RSizes.spaceBtwSections),

              // Cards
              const RDashboardCard(title: 'Sales Total', subTitle: '\$365.6', stats: 25),
              const SizedBox(height: RSizes.spaceBtwItems),
              const RDashboardCard(title: 'Average Order Value', subTitle: '\$25', stats: 15),
              const SizedBox(height: RSizes.spaceBtwItems),
              const RDashboardCard(title: 'Total Orders', subTitle: '36', stats: 44),
              const SizedBox(height: RSizes.spaceBtwItems),
              const RDashboardCard(title: 'Visitors', subTitle: '25,035', stats: 2),
              const SizedBox(height: RSizes.spaceBtwItems),

              /// Bar Graph
              WeeklySalesGraph(),
              SizedBox(height: RSizes.spaceBtwItems),

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
              SizedBox(height: RSizes.spaceBtwItems),

              /// Pie Chart
              OrderStatusPieChart(),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
