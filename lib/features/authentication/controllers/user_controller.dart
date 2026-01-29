import 'package:ecommerce_admin_panel/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_admin_panel/data/repositories/user/user_repository.dart';
import 'package:ecommerce_admin_panel/data/user/user_model.dart';
import 'package:get_x/get.dart';

class UserController  extends GetxController{
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Fetch user details form the repository
  Future<UserModel> fetchUserDetails() async {
    try{
      final user = await userRepository.fetchAdminDetails();
      return user;
    } catch (e){
      RLoaders.errorSnackBar(title: 'Something went wrong', message: e.toString());
      return UserModel.empty();
    }
  }
}