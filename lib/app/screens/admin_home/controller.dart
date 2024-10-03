import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/page_routes.dart';

class AdminHomeController extends GetxController {
  logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    Get.offAllNamed(PageRoutes.LOGIN);
  }
}
