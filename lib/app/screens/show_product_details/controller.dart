import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:safe_store/constants.dart';
import 'package:safe_store/models/category.dart';
import 'package:safe_store/models/product.dart';
import 'package:safe_store/models/restaurant.dart';

class ShowProductDetailsController extends GetxController {
  Product product = Get.arguments;
  RxList<Restaurant> restaurants = <Restaurant>[].obs;
  RxList<Category> categories = <Category>[].obs;


  getRestaurant() async {
    Dio myDio = Dio();
    myDio
        .get(
      '${serverAddress}restaurant',
      options: Options(
        method: 'GET',
        responseType: ResponseType.json,
      ),
    )
        .then((response) {
      if (response.statusCode! < 300) {
        for(var item in response.data){
          Restaurant restaurant = Restaurant.fromJson(item);
          restaurants.add(restaurant);
        }
      } //
      else {
        Get.snackbar('Error', response.data);
      }
    });
  }

  getCategory() async {
    Dio myDio = Dio();
    myDio
        .get(
      '${serverAddress}category',
      options: Options(
        method: 'GET',
        responseType: ResponseType.json,
      ),
    )
        .then((response) {
      if (response.statusCode! < 300) {
        for(var item in response.data){
          Category category = Category.fromJson(item);
          categories.add(category);
        }
      } //
      else {
        Get.snackbar('Error', response.data);
      }
    });
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getRestaurant();
    await getCategory();
  }
}
