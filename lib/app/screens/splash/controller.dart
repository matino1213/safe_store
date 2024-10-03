import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:safe_store/app/common/page_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final RxString _connectionStatus = '-1'.obs;
  final Rx<Connectivity> _connectivity = Connectivity().obs;
  late Rx<List<ConnectivityResult>> result = Rx<List<ConnectivityResult>>([]);

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    if (result.contains(ConnectivityResult.wifi)) {
      _connectionStatus.value = 'wifi net';
    } //
    else if (result.contains(ConnectivityResult.mobile)) {
      _connectionStatus.value = 'mobile net';
    } //
    else if (result.contains(ConnectivityResult.none)) {
      _connectionStatus.value = '-1';
      Get.snackbar(
        'No internet connection',
        'Please turn on mobile data or wifi',
        icon: const Icon(CupertinoIcons.wifi_slash),
      );
    } //
    else {
      _connectionStatus.value = 'Failed to get connectivity.';
    }
    if (_connectionStatus.value != '-1') {
      Future.delayed(const Duration(seconds: 3), () async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        int id = pref.getInt('id') ?? -1;
        if (id == -1) {
          Get.offAllNamed(PageRoutes.LOGIN);
        }//
        else{
          if(pref.getString('role') == 'admin') {
            Get.offAllNamed(PageRoutes.ADMINHOME);
          }
          else{
            Get.offAllNamed(PageRoutes.HOME);
          }
        }
      });
    }
  }

  Future<void> initConnectivity() async {
    try {
      result.value = await _connectivity.value.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    return _updateConnectionStatus(result.value);
  }

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    ever(result, (_) {
      _connectivity.value.onConnectivityChanged.listen(_updateConnectionStatus);
    });
  }
}
