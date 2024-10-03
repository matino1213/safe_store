import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/screens/restaurant/controller.dart';
import 'package:safe_store/app/widgets/loading.dart';
import 'package:safe_store/constants.dart';

class RestaurantScreen extends GetView<RestaurantController> {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: 250,
              alignment: Alignment.topCenter,
              child: Image.network(
                controller.restaurant.value.image ?? '',
                width: Get.width,
                height: Get.height,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: Get.width,
              height: 300,
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter),
              ),
            ),
            Positioned(
              top: 70,
              left: 20,
              child: Material(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  onTap: () => Get.back(),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: const Icon(
                      CupertinoIcons.back,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 70,
              right: 20,
              child: SizedBox(
                height: 70,
                width: 70,
                child: Stack(
                  children: [
                    Material(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                      child: InkWell(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        onTap: () {},
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: const Icon(
                            Icons.shopping_basket_outlined,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: kYellowColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              controller.productCount.toString(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Obx(
                () => Container(
                  width: Get.width,
                  height: Get.height - 190,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.restaurant.value.title ?? '',
                          style: fTitleStyle.copyWith(
                            fontSize: 28,
                          ),
                        ),
                        if ((controller.restaurantLoad.value.title) ==
                            null) ...[
                          const LoadingWidget(),
                        ] //
                        else if (controller.categories.isEmpty) ...[
                          Center(
                            child: Text(
                              'No data',
                              style: fTextStyle,
                            ),
                          ),
                        ] //
                        else if (controller.productCategory.isEmpty) ...[
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: controller.categories.map(
                                (item) {
                                  return Row(
                                    children: [
                                      Material(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        color: (colors..shuffle()).first,
                                        child: InkWell(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          onTap: () {
                                            controller
                                                .selectCategory(item.id ?? 0);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                item.name!,
                                                style: fTextStyle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          const Divider(),
                          Center(
                            child: Text(
                              'No data',
                              style: fTextStyle,
                            ),
                          ),
                        ] //
                        else ...[
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: controller.categories.map(
                                (item) {
                                  return Row(
                                    children: [
                                      Material(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        color: (colors..shuffle()).first,
                                        child: InkWell(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          onTap: () {
                                            controller
                                                .selectCategory(item.id ?? 0);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                item.name!,
                                                style: fTextStyle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          const Divider(),
                          Obx(
                            () => Expanded(
                              child: ListView.builder(
                                itemCount: controller.productCategory.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      controller.productCategory[index].name ??
                                          '',
                                      style: fTextStyle,
                                    ),
                                    subtitle: Text(
                                      '${controller.productCategory[index].price} \$',
                                    ),
                                    leading: CircleAvatar(
                                      backgroundColor: kYellowColor,
                                      child: const Icon(
                                        Icons.fastfood_outlined,
                                        color: Colors.black,
                                      ),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            controller.addProduct(controller
                                                .productCategory[index].id!);
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.green,
                                          ),
                                        ),
                                        Obx(
                                          () => Visibility(
                                            visible: controller.showIcon(
                                                    controller.productCategory[
                                                        index]) >
                                                0,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  controller
                                                      .showIcon(controller
                                                              .productCategory[
                                                          index])
                                                      .toString(),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    controller.minProduct(
                                                        controller
                                                            .productCategory[
                                                                index]
                                                            .id!);
                                                  },
                                                  icon: const Icon(
                                                    Icons.minimize_outlined,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ]
                      ],
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
