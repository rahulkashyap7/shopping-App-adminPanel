import 'package:ecommerce_admin_panel/common/widgets/layouts/header/header.dart';
import 'package:ecommerce_admin_panel/common/widgets/layouts/sidebars/sidebar.dart';
import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColors.primaryBackground,
      body: Row(
        children: [
          Expanded(child: RSidebar()),
          Expanded(
              flex: 5,
              child: Column(
                children: [
                  // HEADER
                  const RHeader(
                    scaffoldKey: null,
                  ),

                  // BODY
                  Expanded(child: body ?? const SizedBox())
                ],
              ))
        ],
      ),
    );
  }
}
