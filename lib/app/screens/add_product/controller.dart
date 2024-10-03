import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/models/restaurant.dart';
import 'package:safe_store/models/category.dart';

import '../../../constants.dart';

class AddProductController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  RxInt restaurantValue = 1.obs;
  RxList<DropdownMenuItem> restaurantList = <DropdownMenuItem>[].obs;
  RxInt categoryValue = 1.obs;
  RxList<DropdownMenuItem> categoryList = <DropdownMenuItem>[].obs;

  getRestaurants() async {
    dio.Dio myDio = dio.Dio();
    myDio
        .get(
      '${serverAddress}restaurant',
      options: dio.Options(
        method: 'GET',
        responseType: dio.ResponseType.json,
      ),
    )
        .then((response) {
      if (response.statusCode! < 300) {
        for (var item in response.data) {
          Restaurant restaurant = Restaurant.fromJson(item);
          DropdownMenuItem dropdownMenuItem = DropdownMenuItem(
            value: restaurant.id!,
            child: Text(restaurant.title!),
          );
          restaurantList.add(dropdownMenuItem);
        }
      } //
      else {
        Get.snackbar('Error', response.statusMessage!);
      }
    });
  }

  getCategories() async {
    dio.Dio myDio = dio.Dio();
    myDio
        .get(
      '${serverAddress}category',
      options: dio.Options(
        method: 'GET',
        responseType: dio.ResponseType.json,
      ),
    )
        .then((response) {
      if (response.statusCode! < 300) {
        for (var item in response.data) {
          Category category = Category.fromJson(item);
          DropdownMenuItem dropdownMenuItem = DropdownMenuItem(
            value: category.id!,
            child: Text(category.name!),
          );
          categoryList.add(dropdownMenuItem);
        }
      } //
      else {
        Get.snackbar('Error', response.statusMessage!);
      }
    });
  }

  addProduct() async {
    if (nameController.text.isEmpty || priceController.text.isEmpty) {
      Get.snackbar('Empty fields', 'Please complete all fields');
      return;
    } //
    Map<String, dynamic> newMap = {};
    newMap['name'] = nameController.text;
    newMap['price'] = priceController.text;
    newMap['restaurantId'] = restaurantValue.value;
    newMap['categoryId'] = categoryValue.value;

    dio.Dio myDio = dio.Dio();
    myDio
        .post(
      '${serverAddress}product',
      data: newMap,
      options: dio.Options(
        method: 'POST',
        responseType: dio.ResponseType.json,
      ),
    )
        .then((response) {
      if (response.statusCode! < 300) {
        Get.snackbar('Success', 'The product was added successfully');
      } //
      else {
        Get.snackbar('Error', response.statusMessage!);
      }
    });
    reset();
  }

  void reset() {
    nameController.clear();
    priceController.clear();
    restaurantValue.value = 1;
    categoryValue.value = 1;
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getRestaurants();
    await getCategories();
  }
}
