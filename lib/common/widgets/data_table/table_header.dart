import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:iconsax/iconsax.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({super.key, this.onPressed, required this.buttonText, this.searchController, this.searchOnChanged});
  
  final Function()? onPressed;
  final String buttonText;
  
  final TextEditingController? searchController;
  final Function(String)? searchOnChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: RDeviceUtils.isDesktopScreen(context) ? 1 : 3,
            child: Row(
              children: [
                SizedBox(width: 200, child: ElevatedButton(onPressed: onPressed, child: Text(buttonText))),
              ],
            )),

        Expanded(
          flex: RDeviceUtils.isDesktopScreen(context) ? 2 : 1,
          child: TextFormField(
            controller: searchController,
            onChanged: searchOnChanged,
            decoration: const InputDecoration(hintText: 'Search here...', prefixIcon: Icon(Iconsax.search_normal)),
          ),
        )
      ],
    );
  }
}
