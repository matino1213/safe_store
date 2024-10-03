import 'package:get/get.dart';
import 'package:safe_store/app/common/page_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  RxString name = ''.obs;
  RxString email = ''.obs;

  getInformation() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    name.value = pref.getString('name') ?? '';
    email.value = pref.getString('email') ?? '';
  }

  logout() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    Get.offAllNamed(PageRoutes.LOGIN);
  }
}
