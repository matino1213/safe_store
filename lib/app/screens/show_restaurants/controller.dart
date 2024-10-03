import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../models/restaurant.dart';
import 'package:dio/dio.dart' as dio;

class ShowRestaurantsController extends GetxController{
  RxList<Restaurant> restaurants = <Restaurant>[].obs;

  getRestaurants() async {
    dio.Dio myDio = dio.Dio();
    dio.Response response = await myDio.get(
      '${serverAddress}restaurant',
      options: dio.Options(
        method: 'GET',
        responseType: dio.ResponseType.json,
      ),
    );
    if (response.statusCode! < 300) {
      for (var item in response.data) {
        restaurants.add(
          Restaurant.fromJson(item),
        );
      }
    } //
    else {
      Get.snackbar('Error', '${response.data}');
      return;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRestaurants();
  }
}