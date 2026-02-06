import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../common/widgets/layouts/header/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class RDashboardCard extends StatelessWidget {
  const RDashboardCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.stats,
    this.icon = Iconsax.arrow_up_3,
    this.color = RColors.success,
    this.onTap,
  });

  final String title, subTitle;
  final IconData icon;
  final Color color;
  final int stats;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RRoundedContainer(
      onTap: onTap,
      padding: EdgeInsets.all(RSizes.lg),
      child: Column(
        children: [
          /// Heading
          RSectionHeading(title: title, textColor: RColors.textSecondary),
          SizedBox(height: RSizes.spaceBtwSections),

          Row(
            children: [
              Text(subTitle, style: Theme.of(context).textTheme.headlineMedium),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: color, size: RSizes.iconSm),
                      Text(
                        '$stats%',
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: color, overflow: TextOverflow.ellipsis),
                      )
                    ],
                  ),
                  Text(
                    'Compared to Dec 2025',
                    style: Theme.of(context).textTheme.labelSmall,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
