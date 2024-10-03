import 'package:get/get.dart';
import 'package:safe_store/app/screens/add_category/controller.dart';
import 'package:safe_store/app/screens/add_product/controller.dart';
import 'package:safe_store/app/screens/add_restaurant/controller.dart';
import 'package:safe_store/app/screens/admin_home/controller.dart';
import 'package:safe_store/app/screens/category/controller.dart';
import 'package:safe_store/app/screens/home/controller.dart';
import 'package:safe_store/app/screens/login/controller.dart';
import 'package:safe_store/app/screens/profile/controller.dart';
import 'package:safe_store/app/screens/restaurant/controller.dart';
import 'package:safe_store/app/screens/shopping_card/controller.dart';
import 'package:safe_store/app/screens/show_product_details/controller.dart';
import 'package:safe_store/app/screens/show_product_list/controller.dart';
import 'package:safe_store/app/screens/show_restaurants/controller.dart';
import 'package:safe_store/app/screens/splash/controller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
    Get.put<HomeController>(HomeController());
    Get.put<UserController>(UserController());
    Get.lazyPut<UserController>(() => UserController(),
        tag: 'signup', fenix: true);
    Get.lazyPut<UserController>(() => UserController(),
        tag: 'login', fenix: true);
    Get.lazyPut<AddCategoryController>(() => AddCategoryController(),
        fenix: true);
    Get.lazyPut<AddProductController>(() => AddProductController(),
        fenix: true);
    Get.lazyPut<AddRestaurantController>(() => AddRestaurantController(),
        fenix: true);
    Get.lazyPut<AdminHomeController>(() => AdminHomeController(), fenix: true);
    Get.lazyPut<ShowProductDetailsController>(
        () => ShowProductDetailsController(),
        fenix: true);
    Get.lazyPut<ShowProductListController>(() => ShowProductListController(),
        fenix: true);
    Get.lazyPut<RestaurantController>(() => RestaurantController(),
        fenix: true);
    Get.lazyPut<CategoryController>(() => CategoryController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<ShoppingCardController>(() => ShoppingCardController(),
        fenix: true);
    Get.lazyPut<ShowRestaurantsController>(() => ShowRestaurantsController(),
        fenix: true);
  }
}
