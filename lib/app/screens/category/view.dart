import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/common/page_routes.dart';
import 'package:safe_store/app/screens/category/controller.dart';
import 'package:safe_store/constants.dart';
import 'package:safe_store/models/product.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              controller.category.name ?? '',
              style: fTitleStyle.copyWith(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.back),
          ),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: controller.products.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Product product = controller.products[index];
              return ListTile(
                title: Text(
                  '${product.name!} (${controller.restaurants.where(
                        (i) => i.id == product.restaurantId,
                      ).first.title})',
                  style: fTextStyle,
                ),
                subtitle: Text('${product.price!} \$'),
                leading: CircleAvatar(
                  backgroundColor: kYellowColor,
                  child: const Icon(
                    Icons.fastfood_outlined,
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Get.toNamed(PageRoutes.RESTAURANT,
                          arguments: controller.restaurants
                              .where(
                                (i) => i.id == product.restaurantId,
                              )
                              .first);
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.green,
                    )),
              );
            },
          ),
        ));
  }
}
