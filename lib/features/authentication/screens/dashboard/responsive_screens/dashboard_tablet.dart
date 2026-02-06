import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../widgets/dashboard_card.dart';

class DashboardTabletScreen extends StatelessWidget {
  const DashboardTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColors.primaryBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Text('Dashboard',
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: RSizes.spaceBtwSections),

              // Cards
              const Column(
                children: [
                  Row(
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
                    ],
                  ),
                  SizedBox(height: RSizes.spaceBtwItems),
                  Row(
                    children: [
                      Expanded(
                          child: RDashboardCard(
                              title: 'Total Orders',
                              subTitle: '36',
                              stats: 44)),
                      SizedBox(width: RSizes.spaceBtwItems),
                      Expanded(
                          child: RDashboardCard(
                              title: 'Visitors', subTitle: '25,035', stats: 2)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
