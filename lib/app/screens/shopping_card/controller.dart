import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:safe_store/constants.dart';
import 'package:safe_store/models/basket.dart';
import 'package:safe_store/models/restaurant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/product.dart';

class ShoppingCardController extends GetConnect {
  Rx<Restaurant> restaurant = Restaurant().obs;
  RxList<Basket> baskets = <Basket>[].obs;
  RxList<Product> products = <Product>[].obs;
  RxInt basketSum = 0.obs;

  getInformation() async {
    baskets.clear();
    products.clear();
    SharedPreferences pref = await SharedPreferences.getInstance();
    int userId = pref.getInt('id') ?? 0;
    Response response = await get('${serverAddress}basket/user/$userId');
    if (response.statusCode! < 300) {
      restaurant.value = Restaurant.fromJson(response.body['restaurant']);
      for (var item in response.body['baskets']) {
        baskets.add(Basket.fromJson(item));
      }
      for (var item in response.body['products']) {
        products.add(Product.fromJson(item));
      }
      getSum();
    }
  }

  getSum() async {
    int sum = 0;
    int productsSum = 0;
    for (var basket in baskets) {
      for (var product in products) {
        if (basket.productId == product.id) {
          productsSum = basket.count! * int.parse(product.price!);
          sum += productsSum;
        }
      }
    }
    basketSum.value = sum;
  }

  checkout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int userId = pref.getInt('id') ?? 0;
    Response response = await get('${serverAddress}basket/checkout/$userId');
    if (response.statusCode! < 300) {
      baskets.clear();
      products.clear();
      restaurant.value = Restaurant();
      basketSum.value = 0;
      Get.back();
      Get.back();
      Get.defaultDialog(
        title: 'Your shopping cart has been cleared successfully.',
        middleText: '',
        actions: [
          Center(
            child: Image.asset(
              'assets/images/success.png',
            ),
          ),
        ],
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
