import 'package:ecommerce_admin_panel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_x/get_core/src/get_main.dart';
import 'package:get_x/get_instance/src/extension_instance.dart';
import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';

/// Entry point of Flutter app
Future<void> main() async {
  // Ensure that widgets ae initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetX Local Storage

  // Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions
      .currentPlatform).then((value) => Get.put(AuthenticationRepository()));

  // Main App Starts here..
  runApp(const App());
}
