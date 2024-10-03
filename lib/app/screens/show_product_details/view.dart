import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/screens/show_product_details/controller.dart';

import '../../../constants.dart';

class ShowProductDetailsScreen extends GetView<ShowProductDetailsController> {
  const ShowProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${controller.product.name}',
          style: fTitleStyle.copyWith(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundColor: kYellowColor,
              child: const Icon(
                Icons.fastfood_outlined,
                color: Colors.black,
                size: 50,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Text(controller.product.name!),
            leading: const Icon(Icons.drive_file_rename_outline),
          ),
          ListTile(
            title: const Text(
              'Price',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Text(controller.product.price!),
            leading: const Icon(CupertinoIcons.money_dollar),
          ),
          Obx(
            () => ListTile(
              title: const Text(
                'Category',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(controller.categories
                      .where((category) =>
                          category.id == controller.product.categoryId)
                      .isNotEmpty
                  ? controller.categories
                      .where((category) =>
                          category.id == controller.product.categoryId)
                      .first
                      .name!
                  : 'Category not found'),
              leading: const Icon(Icons.food_bank_outlined),
            ),
          ),
          Obx(
            () => ListTile(
              title: const Text(
                'Restaurant',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(controller.restaurants
                      .where((restaurant) =>
                          restaurant.id == controller.product.restaurantId)
                      .isNotEmpty
                  ? controller.restaurants
                      .where((restaurant) =>
                          restaurant.id == controller.product.restaurantId)
                      .first
                      .title!
                  : 'Restaurant not found'),
              leading: const Icon(Icons.restaurant),
            ),
          ),
        ],
      ),
    );
  }
}
