import 'package:ecommerce_admin_panel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app.dart';

/// Entry point of Flutter app
Future<void> main() async {
  // Ensure that widgets ae initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetX Local Storage

  // Remove # sign from url
  setPathUrlStrategy();

  // Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      // .then((_) => Get.put(AuthenticationRepository()));

  // Main App Starts here..
  runApp(const App());
}