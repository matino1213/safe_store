import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/common/page_routes.dart';
import 'package:safe_store/app/screens/home/controller.dart';
import 'package:safe_store/models/category.dart';
import '../../constants.dart';

class ShowCategories extends GetView<HomeController> {
  const ShowCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: Get.width,
        height: 120,
        child: ListView.builder(
          itemCount: controller.categories.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Category category = controller.categories[index];
            return Row(
              children: [
                Material(
                  color: (colors..shuffle()).first,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    onTap: () {
                      Get.toNamed(
                        PageRoutes.CATEGORY,
                        arguments: category,
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        border: Border.all(
                          width: 1.5,
                          color: Colors.black12,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          category.name ?? '',
                          style: fTitleStyle.copyWith(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
