import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safe_store/constants.dart';

class AddRestaurantController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxInt isSlide = 1.obs;
  Rx<File> file = File('-1').obs;

  Future<void> selectImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery) ?? XFile('-1');
    if (pickedImage.path != '-1') {
      file.value = File(pickedImage.path);
    }
  }

  addRestaurant() async {
    String title = titleController.text;
    String address = addressController.text;
    String description = descriptionController.text;
    int slide = isSlide.value;
    Map<String, dynamic> newMap = {};
    newMap['title'] = title;
    newMap['address'] = address;
    newMap['description'] = description;
    newMap['isSlide'] = slide;

    if (titleController.text.isEmpty ||
        addressController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      Get.snackbar('Empty fields', 'Please complete all fields');
      return;
    } //
    else if (file.value.path == '-1') {
      Get.snackbar('Empty image', 'No file selected');
      return;
    } //
    else {
      newMap['imageFile'] = await dio.MultipartFile.fromFile(file.value.path,
          filename: file.value.path.split('/').last);
    }

    dio.Dio myDio = dio.Dio();
    dio.FormData formData = dio.FormData.fromMap(newMap);

    dio.Response response = await myDio.post(
      '${serverAddress}restaurant',
      data: formData,
      options: dio.Options(
        method: 'POST',
        responseType: dio.ResponseType.json,
      ),
    );
    if (response.statusCode! < 300) {
      Get.snackbar('Success', 'The restaurant was added successfully');
    } else {
        Get.snackbar('Error', response.statusMessage!);
    }
    reset();
  }

  void reset() {
    titleController.clear();
    descriptionController.clear();
    addressController.clear();
    isSlide.value = 1;
    file.value = File('-1');
  }
}
