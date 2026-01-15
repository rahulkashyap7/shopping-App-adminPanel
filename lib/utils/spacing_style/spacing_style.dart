import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class RSpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: RSizes.appbarHeight,
    left: RSizes.defaultSpace,
    bottom: RSizes.defaultSpace,
    right: RSizes.defaultSpace,
  );
}