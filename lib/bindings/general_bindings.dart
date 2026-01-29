import 'package:get_x/get.dart';
import '../localization/network_manager/network_manager.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies(){
    /// -- Core
    Get.lazyPut(() => NetworkManager(), fenix: true);

    // Get.lazyPut(() => UserController(), fenix: true);
  }
}