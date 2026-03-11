import 'package:ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ecommerce_admin_panel/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get.dart';

import '../../../../../../common/widgets/data_table/table_header.dart';

class CategoriesDesktopScreen extends StatelessWidget {
  const CategoriesDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumbs
              RBreadcrumbWithHeading(heading: 'Categories', breadcrumbItems: ['Categories']),
              const SizedBox(height: RSizes.spaceBtwSections),

            // Table Only
              RRoundedContainer(
                  child: Column(
                    children: [
                      // Table Header
                      TableHeader(buttonText: 'Create New Category', onPressed: () => Get.toNamed(RRoutes.createCategory)),
                      SizedBox(height: RSizes.spaceBtwSections),

                      // Table
                      CategoryTable(),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
