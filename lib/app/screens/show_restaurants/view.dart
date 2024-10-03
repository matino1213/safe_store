import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/screens/show_restaurants/controller.dart';

import '../../../constants.dart';
import '../../common/page_routes.dart';

class ShowRestaurantsScreen extends GetView<ShowRestaurantsController> {
  const ShowRestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Restaurant',
          style: fTitleStyle.copyWith(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          controller.restaurants.isEmpty
              ? Center(
                  child: Text(
                    'No data!',
                    style: fTextStyle,
                  ),
                )
              : Expanded(
                  child: Obx(() {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.network(
                            controller.restaurants[index].image ?? '-1',
                            height: 70,
                            width: 70,
                          ),
                          title: Text(
                              controller.restaurants[index].title ?? 'error'),
                          subtitle: Text(
                              controller.restaurants[index].address ?? 'error'),
                          onTap: () => Get.toNamed(
                            PageRoutes.SHOWRESTAURANT,
                            arguments: controller.restaurants[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: controller.restaurants.length,
                    );
                  }),
                ),
        ],
      ),
    );
  }
}
