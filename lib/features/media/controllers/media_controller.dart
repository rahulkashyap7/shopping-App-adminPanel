import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get_x/get.dart';
import '../../../utils/constants/enums.dart';

class MediaController extends GetxController{
  static MediaController get instance => Get.find();

  late DropzoneViewController dropzoneController;
  final RxBool showImageUploaderSection = false.obs;
  final Rx<MediaCategory> selectedPath = MediaCategory.folders.obs;
}