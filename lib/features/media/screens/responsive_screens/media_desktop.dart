import 'package:ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Breadcrumbs
                RBreadcrumbWithHeading(heading: 'Media', breadcrumbItems: [RRoutes.login, RRoutes.forgetPassword, 'Media Screen'], returnToPreviousScreen: true),
              ],
            ),
            SizedBox(height: RSizes.spaceBtwSections),

            /// Upload Area

            /// Media
          ],
        ),
        ),
      ),
    );
  }
}
