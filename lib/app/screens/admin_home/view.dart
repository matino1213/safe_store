import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/screens/admin_home/controller.dart';

import '../../../constants.dart';
import '../../common/page_routes.dart';
import '../../widgets/custom_button.dart';

class AdminHomeScreen extends GetView<AdminHomeController> {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomButton(
              text: 'Add Restaurant',
              onTapped: () => Get.toNamed(PageRoutes.ADDRESTAURANT),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              text: 'Add Category',
              onTapped: () => Get.toNamed(PageRoutes.ADDCATEGORY),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              text: 'Add Product',
              onTapped: () => Get.toNamed(PageRoutes.ADDPRODUCT),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              color: Colors.red,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  controller.logout();
                },
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: SizedBox(
                  width: Get.width,
                  height: 70,
                  child: Center(
                    child: Text(
                      'Log Out',
                      style: fTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
