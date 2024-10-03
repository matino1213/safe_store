import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/common/page_routes.dart';
import 'package:safe_store/app/screens/profile/view.dart';
import 'package:safe_store/app/screens/shopping_card/view.dart';
import 'package:safe_store/app/widgets/home_page.dart';
import 'package:safe_store/constants.dart';
import 'package:safe_store/models/category.dart';
import 'package:safe_store/models/restaurant.dart';

class HomeController extends GetConnect {
  RxInt currentIndex = 2.obs;
  TextEditingController searchController = TextEditingController();
  RxList<Restaurant> restaurants = <Restaurant>[].obs;
  RxList<Restaurant> bestRestaurants = <Restaurant>[].obs;
  RxList<Restaurant> newRestaurants = <Restaurant>[].obs;
  RxList<Restaurant> restaurantImages = <Restaurant>[].obs;
  RxList<Category> categories = <Category>[].obs;
  final Rx<CarouselSliderController> sliderController =
      CarouselSliderController().obs;
  RxInt currentSlide = 0.obs;
  RxList<Widget> imageSliders = <Widget>[].obs;
  RxList<Widget> pages = <Widget>[
    const ProfileScreen(),
    const ShoppingCardScreen(),
    const HomePage(),
  ].obs;

  search() async {
    restaurants.clear();
    String text = searchController.text;
    if (text.isNotEmpty) {
      Response response = await get(
        '${serverAddress}restaurant/$text',
      );
      if (response.statusCode! < 300) {
        for (var item in response.body) {
          Restaurant restaurant = Restaurant.fromJson(item);
          restaurants.add(restaurant);
        }
      } //
      else {
        return;
      }
    } //
    else {
      Response response = await get(
        '${serverAddress}restaurant',
      );
      if (response.statusCode! < 300) {
        for (var item in response.body) {
          Restaurant restaurant = Restaurant.fromJson(item);
          restaurants.add(restaurant);
        }
      } //
      else {
        return;
      }
    }
  }

  getRestaurantImages() async {
    Response response = await get('${serverAddress}restaurant');
    if (response.statusCode! < 300) {
      List<Restaurant> tempRestaurants = [];
      for (var item in response.body) {
        if (item['isSlide'] == 1) {
          tempRestaurants.add(Restaurant.fromJson(item));
        }
      }
      tempRestaurants.sort((a, b) => b.counter!.compareTo(a.counter!));
      bestRestaurants.assignAll(tempRestaurants);
      List<Restaurant> topRestaurants = tempRestaurants.take(3).toList();
      restaurantImages.assignAll(topRestaurants.take(5).toList());
      tempRestaurants.sort((a, b) =>
          DateTime.parse(b.createAt!).compareTo(DateTime.parse(a.createAt!)));
      newRestaurants.assignAll(tempRestaurants.take(4).toList());

      final List<Widget> imageSlider = restaurantImages
          .map(
            (item) => GestureDetector(
              onTap: () => Get.toNamed(
                PageRoutes.RESTAURANT,
                arguments: item,
              ),
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        item.image!,
                        fit: BoxFit.fill,
                        width: Get.width,
                        height: Get.height,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              item.title!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList();
      imageSliders.value = imageSlider;
    }
  }

  getCategories() async {
    Response response = await get('${serverAddress}category');
    if (response.statusCode! < 300) {
      for (var item in response.body) {
        categories.add(Category.fromJson(item));
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRestaurantImages();
    getCategories();
  }
}
