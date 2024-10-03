import 'package:get/get.dart';
import 'package:safe_store/app/screens/add_category/view.dart';
import 'package:safe_store/app/screens/add_product/view.dart';
import 'package:safe_store/app/screens/add_restaurant/view.dart';
import 'package:safe_store/app/screens/admin_home/view.dart';
import 'package:safe_store/app/screens/category/view.dart';
import 'package:safe_store/app/screens/home/view.dart';
import 'package:safe_store/app/screens/intro/view.dart';
import 'package:safe_store/app/screens/login/view.dart';
import 'package:safe_store/app/screens/restaurant/view.dart';
import 'package:safe_store/app/screens/show_product_details/view.dart';
import 'package:safe_store/app/screens/show_product_list/view.dart';
import 'package:safe_store/app/screens/show_restaurants/view.dart';
import 'package:safe_store/app/screens/signup/view.dart';
import 'package:safe_store/app/screens/splash/view.dart';

import '../screens/show_restaurant/view.dart';

class PageRoutes {
  static const SPLASH = "/Splash";
  static const INTRO = "/Intro";
  static const SIGNUP = "/Signup";
  static const LOGIN = "/Login";
  static const HOME = "/Home";
  static const ADMINHOME = "/AdminHome";
  static const ADDRESTAURANT = "/AddRestaurant";
  static const SHOWRESTAURANT = "/ShowRestaurant";
  static const SHOWRESTAURANTS = "/ShowRestaurants";
  static const ADDCATEGORY = "/AddCategory";
  static const ADDPRODUCT = "/AddProduct";
  static const SHOWPRODUCTLIST = "/ShowProductList";
  static const SHOWPRODUCTDETAILS = "/ShowProductDetails";
  static const RESTAURANT = "/Restaurant";
  static const CATEGORY = "/Category";

  static List<GetPage> routes = [
    GetPage(
      name: PageRoutes.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: PageRoutes.INTRO,
      page: () => IntroScreen(),
    ),
    GetPage(
      name: PageRoutes.SIGNUP,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: PageRoutes.LOGIN,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: PageRoutes.HOME,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: PageRoutes.ADMINHOME,
      page: () => const AdminHomeScreen(),
    ),
    GetPage(
      name: PageRoutes.ADDRESTAURANT,
      page: () => const AddRestaurantScreen(),
    ),
    GetPage(
      name: PageRoutes.SHOWRESTAURANT,
      page: () => ShowRestaurantScreen(),
    ),
    GetPage(
      name: PageRoutes.ADDCATEGORY,
      page: () => const AddCategoryScreen(),
    ),
    GetPage(
      name: PageRoutes.ADDPRODUCT,
      page: () => const AddProductScreen(),
    ),
    GetPage(
      name: PageRoutes.SHOWPRODUCTLIST,
      page: () => const ShowProductListScreen(),
    ),
    GetPage(
      name: PageRoutes.SHOWPRODUCTDETAILS,
      page: () => const ShowProductDetailsScreen(),
    ),
    GetPage(
      name: PageRoutes.RESTAURANT,
      page: () => const RestaurantScreen(),
    ),
    GetPage(
      name: PageRoutes.CATEGORY,
      page: () => const CategoryScreen(),
    ),
    GetPage(
      name: PageRoutes.SHOWRESTAURANTS,
      page: () => const ShowRestaurantsScreen(),
    ),
  ];
}
