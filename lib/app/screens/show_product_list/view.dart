import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/screens/show_product_list/controller.dart';

import '../../../constants.dart';
import '../../common/page_routes.dart';

class ShowProductListScreen extends GetView<ShowProductListController> {
  const ShowProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products List',
          style: fTitleStyle.copyWith(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundColor: kYellowColor,
                      child: const Icon(
                        Icons.fastfood_outlined,
                        color: Colors.black,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.products[index].name ?? 'error'),
                        Text(controller.products[index].price ?? 'error'),
                      ],
                    ),
                    subtitle: Text(controller.categories
                        .where((category) =>
                            category.id == controller.products[index].categoryId)
                        .first
                        .name!),
                    onTap: () => Get.toNamed(
                      PageRoutes.SHOWPRODUCTDETAILS,
                      arguments: controller.products[index],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: controller.products.length,
              );
            }),
          ),
        ],
      ),
    );
  }
}
