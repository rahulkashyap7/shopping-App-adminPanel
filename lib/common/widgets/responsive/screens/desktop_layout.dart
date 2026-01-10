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
          Expanded(child: Drawer()),
          Expanded(
            flex: 5,
            child: Column(
            children: [
              // HEADER
              RRoundedContainer(
                width: double.infinity,
                height: 75,
                backgroundColor: Colors.yellow.withOpacity(0.2),
              ),

              // BODY
              body ?? const SizedBox()
            ],
          ))
        ],
      ),
    );
  }
}
