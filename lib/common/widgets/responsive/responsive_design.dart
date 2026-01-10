import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class ResponsiveWidget extends StatelessWidget{
  const ResponsiveWidget({super.key, required this.desktop, required this.tablet, required this.mobile});

  /// Widget for desktop layout
  final Widget desktop;

  /// Widget for desktop layout
  final Widget tablet;

  /// Widget for desktop layout
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints){
      if (constraints.maxWidth >= RSizes.desktopScreenSize) {
        return desktop;
      } else if (constraints.maxWidth < RSizes.desktopScreenSize &&
          constraints.maxWidth >= RSizes.tabletScreenSize) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}