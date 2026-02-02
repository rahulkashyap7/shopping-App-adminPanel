import 'package:ecommerce_admin_panel/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_admin_panel/data/repositories/user/user_repository.dart';
import 'package:ecommerce_admin_panel/data/user/user_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x/get.dart';

class UserController  extends GetxController{
  static UserController get instance => Get.find();

  RxBool loading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final userRepository = Get.put(UserRepository());


  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  /// Fetch user details form the repository
  Future<UserModel> fetchUserDetails() async {
    try{
      loading.value = true;
      final user = await userRepository.fetchAdminDetails();
      this.user.value = user;
      loading.value = false;
      return user;
    } catch (e){
      loading.value = false;
      RLoaders.errorSnackBar(title: 'Something went wrong', message: e.toString());
      return UserModel.empty();
    }
  }
}