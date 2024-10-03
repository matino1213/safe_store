import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/constants.dart';
import 'package:safe_store/models/basket.dart';
import 'package:safe_store/models/category.dart';
import 'package:safe_store/models/product.dart';
import 'package:safe_store/models/restaurant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantController extends GetConnect {
  Rx<Restaurant> restaurant = Restaurant().obs;
  Rx<Restaurant> restaurantLoad = Restaurant().obs;
  RxInt productCount = 0.obs;
  RxList<Category> categories = <Category>[Category(id: 0, name: 'All')].obs;
  RxList<Product> products = <Product>[].obs;
  RxList<Product> productCategory = <Product>[].obs;
  RxList<Basket> baskets = <Basket>[].obs;

  getInformation() async {
    Response response = await get(
      '${serverAddress}restaurant/id/${restaurant.value.id}',
    );
    if (response.statusCode! < 300) {
      restaurantLoad.value = Restaurant.fromJson(response.body['restaurant']);
      for (var item in response.body['categories']) {
        categories.add(Category.fromJson(item));
      }
      for (var item in response.body['products']) {
        products.add(Product.fromJson(item));
      }
      productCategory.assignAll(List<Product>.from(products));
    }
    SharedPreferences pref = await SharedPreferences.getInstance();
    int userId = pref.getInt('id')!;
    Response response1 = await get('${serverAddress}basket/$userId');
    if (response1.statusCode! < 300) {
      for (var item in response1.body) {
        baskets.add(Basket.fromJson(item));
        int x = item['count'];
        productCount.value += x;
      }
    }
  }

  selectCategory(int id) {
    productCategory.clear();
    if (id == 0) {
      productCategory.assignAll(List<Product>.from(products));
    } else {
      var filteredProducts =
          products.where((item) => item.categoryId == id).toList();
      productCategory.assignAll(List<Product>.from(filteredProducts));
    }
    productCategory.refresh();
  }

  addProduct(int productId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int userId = pref.getInt('id')!;
    Map<String, dynamic> newMap = {};
    newMap['userId'] = userId;
    newMap['productId'] = productId;
    newMap['restaurantId'] = restaurant.value.id;

    Response response = await post(
      '${serverAddress}basket',
      newMap,
    );
    if (response.statusCode! < 300) {
      baskets.clear();
      productCount.value = 0;
      for (var item in response.body) {
        baskets.add(Basket.fromJson(item));
        int x = item['count'];
        productCount.value += x;
      }
    } //
    else if (response.body ==
        'You cannot add products from different restaurants at the same time.') {
      Get.defaultDialog(
          titleStyle: const TextStyle(
            color: Colors.red,
          ),
          title: 'Error',
          middleText:
              'You cannot add products from different restaurants at the same time.',
          actions: [
            Material(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              color: kYellowColor,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                onTap: () {
                  clearBasket();
                  Get.back();
                },
                child: SizedBox(
                  width: Get.width,
                  height: 60,
                  child: Center(
                    child: Text(
                      'Clear Shopping Card',
                      style: fTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              onTap: () {
                Get.back();
              },
              child: Container(
                width: Get.width,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    width: 2,
                    color: Colors.red,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Cancel',
                    style: fTextStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ]);
    }
  }

  minProduct(int productId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int userId = pref.getInt('id')!;
    Map<String, dynamic> newMap = {};
    newMap['userId'] = userId;
    newMap['productId'] = productId;
    newMap['restaurantId'] = restaurant.value.id;

    Response response = await post(
      '${serverAddress}basket/min',
      newMap,
    );
    if (response.statusCode! < 300) {
      baskets.clear();
      productCount.value = 0;
      for (var item in response.body) {
        baskets.add(Basket.fromJson(item));
        int x = item['count'];
        productCount.value += x;
      }
    }
  }

  int showIcon(Product product) {
    for (var item in baskets) {
      if (product.id == item.productId) {
        return item.count!;
      }
    }

    return 0;
  }

  clearBasket() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int userId = pref.getInt('id')!;
    Response response = await delete('${serverAddress}basket/delete/$userId');
    if (response.statusCode! < 300) {
      Get.snackbar('Success', 'Shopping card removed successfully');
      baskets.clear();
      productCount.value = 0;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    restaurant.value = Get.arguments;
    getInformation();
  }
}
