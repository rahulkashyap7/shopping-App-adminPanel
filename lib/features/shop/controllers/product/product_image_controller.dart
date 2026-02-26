import 'package:ecommerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:ecommerce_admin_panel/features/media/models/image_model.dart';
import 'package:get_x/get.dart';

class ProductImageController extends GetxController {
  static ProductImageController get instance => Get.find();

  // Rx obervable for the selected thumbnail image
  Rx<String?> selectedThumbnailImageUrl = Rx<String?>(null);

  // Lists to store additional product images
  final RxList<String> additionalProductImageUrls = <String>[].obs;


  /// Pick Thumbnail Image from Media
  void selectedThumbnailImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImageFromMedia();

    // Handle the selected images
    if (selectedImages != null && selectedImages.isNotEmpty) {
      // Set the selected image to the main or perform any other action
      ImageModel selectedImage = selectedImages.first;
      // Upload the main image using the selectedImage
      selectedThumbnailImageUrl.value = selectedImage.url;
    }
  }

  /// Pick Multiple images rom media
  void selectedMultipleProductImage() async {
    final controller = Get.put(MediaController());
    final selectedImages = await controller.selectImageFromMedia(multipleSelection: true, selectedUrls: additionalProductImageUrls);

    // Handle the selected images
    if (selectedImages != null && selectedImages.isNotEmpty) {
      additionalProductImageUrls.assignAll(selectedImages.map((e) => e.url));
    }}

  /// Function to remove Product image
  Future<void> removeImage(int index) async {
    additionalProductImageUrls.removeAt(index);
  }
}
