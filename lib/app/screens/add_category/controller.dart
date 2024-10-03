import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:safe_store/constants.dart';

class AddCategoryController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  addCategory() async {
    if (nameController.text.isEmpty || descriptionController.text.isEmpty) {
      Get.snackbar('Empty fields', 'Please complete all fields');
      return;
    } //
    Map<String, dynamic> newMap = {};
    newMap['name'] = nameController.text;
    newMap['description'] = descriptionController.text;

    dio.Dio myDio = dio.Dio();
    myDio
        .post(
      '${serverAddress}category',
      data: newMap,
      options: dio.Options(
        method: 'POST',
        responseType: dio.ResponseType.json,
      ),
    )
        .then((response) {
      if (response.statusCode! < 300) {
        Get.snackbar('Success', 'The category was added successfully');
      } //
      else {
        Get.snackbar('Error', response.statusMessage!);
      }
    });
    reset();
  }

  void reset() {
    nameController.clear();
    descriptionController.clear();
  }
}
