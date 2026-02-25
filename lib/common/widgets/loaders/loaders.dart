import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_function.dart';

class RLoaders {
  static void hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static void customToast({required String message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: RHelperFunctions.isDarkMode(Get.context!)
                ? RColors.darkerGrey.withValues(alpha: 0.9)
                : RColors.grey.withValues(alpha: 0.9),
          ),
          child: Center(
              child: Text(message,
                  style: Theme.of(Get.context!).textTheme.labelLarge)),
        ),
      ),
    );
  }

  static void _showSnackBar({
    required String title,
    required String message,
    required Color backgroundColor,
    required IconData icon,
    int duration = 3,
  }) {
    final context = Get.context;
    if (context == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  if (message.isNotEmpty)
                    Text(message,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        duration: Duration(seconds: duration),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 6,
      ),
    );
  }

  static void successSnackBar(
      {required dynamic title, dynamic message = '', int duration = 3}) {
    _showSnackBar(
      title: title.toString(),
      message: message.toString(),
      backgroundColor: RColors.primary,
      icon: Iconsax.check,
      duration: duration,
    );
  }

  static void warningSnackBar({required dynamic title, dynamic message = ''}) {
    _showSnackBar(
      title: title.toString(),
      message: message.toString(),
      backgroundColor: Colors.orange,
      icon: Iconsax.warning_2,
    );
  }

  static void errorSnackBar({required dynamic title, dynamic message = ''}) {
    _showSnackBar(
      title: title.toString(),
      message: message.toString(),
      backgroundColor: Colors.red.shade600,
      icon: Iconsax.warning_2,
    );
  }
}
