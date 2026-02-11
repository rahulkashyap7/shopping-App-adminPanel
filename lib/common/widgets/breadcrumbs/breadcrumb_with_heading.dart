import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/media/screens/widgets/page_heading.dart';

class RBreadcrumbWithHeading extends StatelessWidget {
  const RBreadcrumbWithHeading(
      {super.key, required this.heading, required this.breadcrumbItems, this.returnToPreviousScreen = false});

  // The heading for the page
  final String heading;

  // List of breadcrumb items representing the navigation path
  final List<String> breadcrumbItems;

  // Flag indicating whether to include a button to return to the previous screen
  final bool returnToPreviousScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Breadcrumb trail
        Row(
          children: [
            // Dashboard Link
            InkWell(
              onTap: () => Get.offAllNamed(RRoutes.dashboard),
              child: Padding(
                padding: const EdgeInsets.all(RSizes.xs),
                child: Text(
                  'Dashboard',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall!
                      .apply(fontWeightDelta: -1),
                ),
              ),
            ),

            for (int i = 0; i < breadcrumbItems.length; i++)
              Row(
                children: [
                  Text('/'), // Separator
                  InkWell(
                    onTap: i == breadcrumbItems.length - 1 ? null : () =>
                        Get.toNamed(breadcrumbItems[i]),
                    child: Padding(
                      padding: const EdgeInsets.all(RSizes.xs),

                      // Format breadcrumb item: capitalize and remove leading '/'
                      child: Text(
                        i == breadcrumbItems.length - 1 ? breadcrumbItems[i]
                            .capitalize.toString() : capitalize(breadcrumbItems[i].substring(1)),
                        style: Theme.of(context).textTheme.bodySmall!.apply(fontWeightDelta: -1),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),

        const SizedBox(height: RSizes.sm),

        // Heading of the page
        Row(
          children: [
            if (returnToPreviousScreen) IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left)),
            if (returnToPreviousScreen) const SizedBox(width: RSizes.spaceBtwItems),
            RPageHeading(heading: heading),
          ],
        )
      ],
    );
  }

  // Function to capitalize the first letter of a String
  String capitalize(String s) {
    return s.isEmpty ? '' : s[0].toUpperCase() + s.substring(1);
  }
}
