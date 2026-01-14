import 'package:ecommerce_admin_panel/common/widgets/layouts/header/header.dart';
import 'package:ecommerce_admin_panel/common/widgets/layouts/sidebars/sidebar.dart';
import 'package:flutter/material.dart';
import '../../custom_shapes/container/rounded_container.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});

  final Widget? body;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: RSidebar()),
          Expanded(
            flex: 5,
            child: Column(
            children: [
              // HEADER
              const RHeader(scaffoldKey: null,),

              // BODY
              body ?? const SizedBox()
            ],
          ))
        ],
      ),
    );
  }
}
