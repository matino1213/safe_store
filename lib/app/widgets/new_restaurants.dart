import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/screens/home/controller.dart';
import '../../constants.dart';
import '../../models/restaurant.dart';
import '../common/page_routes.dart';

class NewRestaurants extends GetView<HomeController> {
  const NewRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: Get.width,
        height: 220,
        child: ListView.builder(
          itemCount: controller.newRestaurants.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Restaurant restaurant = controller.newRestaurants[index];
            return Row(
              children: [
                InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  onTap: () => Get.toNamed(
                    PageRoutes.RESTAURANT,
                    arguments: restaurant,
                  ),
                  child: Container(
                    width: 160,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.black12,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(8),
                            ),
                            child: Image.network(
                              restaurant.image ?? '',
                              width: Get.width,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            restaurant.title ?? '',
                            style: fTextStyle.copyWith(fontSize: 15),
                          ),
                          Text(
                            restaurant.address ?? '',
                            style: fTextStyle.copyWith(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/new.gif',
                            width: 30,
                            height: 30,
                          ),
                        ],
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
