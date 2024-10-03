import 'package:get/get.dart';
import 'package:safe_store/constants.dart';
import 'package:safe_store/models/category.dart';
import 'package:safe_store/models/product.dart';
import 'package:safe_store/models/restaurant.dart';

class CategoryController extends GetConnect {
  Category category = Get.arguments;
  RxList<Product> products = <Product>[].obs;
  RxList<Restaurant> restaurants = <Restaurant>[].obs;

  getProducts() async {
    Response response = await get('${serverAddress}product');
    Response response1 = await get('${serverAddress}restaurant');
    if (response.statusCode! < 300 && response1.statusCode! < 300) {
      for (var item in response.body) {
        if (item['categoryId'] == category.id) {
          products.add(Product.fromJson(item));
        }
      }
      for (var item in response1.body) {
        restaurants.add(Restaurant.fromJson(item));
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProducts();
  }
}
