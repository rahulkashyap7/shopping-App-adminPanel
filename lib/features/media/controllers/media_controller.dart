import 'dart:typed_data';
import 'package:ecommerce_admin_panel/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_admin_panel/data/services.cloud_storage/media_repository.dart';
import 'package:ecommerce_admin_panel/features/media/models/image_model.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:ecommerce_admin_panel/utils/popups/dialogs.dart';
import 'package:ecommerce_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get_x/get.dart';
import '../../../utils/constants/enums.dart';

class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  late DropzoneViewController dropzoneController;
  final RxBool showImageUploaderSection = false.obs;
  final Rx<MediaCategory> selectedPath = MediaCategory.folders.obs;
  final RxList<ImageModel> selectedImagesToUpload = <ImageModel>[].obs;

  final RxList<ImageModel> allImages = <ImageModel>[].obs;
  final RxList<ImageModel> allBannerImages = <ImageModel>[].obs;
  final RxList<ImageModel> allProductImages = <ImageModel>[].obs;
  final RxList<ImageModel> allBrandImages = <ImageModel>[].obs;
  final RxList<ImageModel> allCategoryImages = <ImageModel>[].obs;
  final RxList<ImageModel> allUserImages = <ImageModel>[].obs;

  final MediaRepository mediaRepository = MediaRepository();

  Future<void> selectedLocalImages() async {
    final files = await dropzoneController
        .pickFiles(multiple: true, mime: ['image/jpeg', 'image/png']);

    if (files.isNotEmpty) {
      for (var file in files) {
        final bytes = await dropzoneController.getFileData(file);
        final filename = await dropzoneController.getFilename(file);
        final image = ImageModel(
          url: '',
          file: file,
          folder: '',
          filename: filename,
          localImageToDisplay: Uint8List.fromList(bytes),
        );
        selectedImagesToUpload.add(image);
      }
    }
  }

  void uploadImagesConfirmation() {
    if (selectedPath.value == MediaCategory.folders) {
      RLoaders.warningSnackBar(
          title: 'Select Folder',
          message: 'Please select the Folder in Order to upload the Images.');
      return;
    }

    RDialogs.defaultDialog(
      context: Get.context!,
      title: 'Upload Images',
      confirmText: 'Upload',
      onConfirm: () async => await uploadImages(),
      content:
          'Are you sure you want to upload all the Images in ${selectedPath.value.name.toUpperCase()} folder?',
    );
  }

  Future<void> uploadImages() async {
    try {
      // Remove confirmation box
      Get.back();

      // Loader
      uploadImagesLoader();

      // Get the selected category
      MediaCategory selectedCategory = selectedPath.value;

      // Get the corresponding list to update
      RxList<ImageModel> targetList;

      switch (selectedCategory) {
        case MediaCategory.banners:
          targetList = allBannerImages;
          break;
        case MediaCategory.brands:
          targetList = allBrandImages;
          break;
        case MediaCategory.categories:
          targetList = allCategoryImages;
          break;
        case MediaCategory.products:
          targetList = allProductImages;
          break;
        case MediaCategory.users:
          targetList = allUserImages;
          break;
        default:
          return;
      }

      // Upload and add images to the target List
      for (int i = selectedImagesToUpload.length - 1; i >= 0; i--) {
        var selectedImage = selectedImagesToUpload[i];
        // Upload Image to the storage
        final ImageModel uploadedImage =
            await mediaRepository.uploadImageFileInStorage(
          file: selectedImage.localImageToDisplay!,
          path: getSelectedPath(),
          imageName: selectedImage.filename,
        );

        // Upload Image to the Firestore
        uploadedImage.mediaCategory = selectedCategory.name;
        final id =
            await mediaRepository.uploadImageFileInDatabase(uploadedImage);

        uploadedImage.id = id;

        selectedImagesToUpload.removeAt(i);
        targetList.add(uploadedImage);
      }

      // Stop Loader after successful upload
      RFullScreenLoader.stopLoading();
    } catch (e) {
      // Stop Loader in case of an error
      RFullScreenLoader.stopLoading();

      // Show a warning snack-bar for the error
      RLoaders.warningSnackBar(
          title: 'Error Uploading Images',
          message: 'Something went wrong while uploading your images.');
    }
  }

  void uploadImagesLoader() {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) => PopScope(
              canPop: false,
              child: AlertDialog(
                title: const Text('Uploading Images'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      RImages.uploadingImageIllustration,
                      height: 300,
                      width: 300,
                    ),
                    const SizedBox(height: RSizes.spaceBtwItems),
                    Text('Sit Tight, Your images are uploading...'),
                  ],
                ),
              ),
            ));
  }

  String getSelectedPath() {
    String path = '';
    switch (selectedPath.value) {
      case MediaCategory.banners:
        path = RTexts.bannerStoragePath;
        break;
      case MediaCategory.brands:
        path = RTexts.brandsStoragePath;
        break;
      case MediaCategory.categories:
        path = RTexts.categoriesStoragePath;
        break;
      case MediaCategory.products:
        path = RTexts.productsStoragePath;
        break;
      case MediaCategory.users:
        path = RTexts.usersStoragePath;
        break;
      default:
        path = 'Others';
    }
    return path;
  }
}
