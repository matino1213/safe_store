import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/screens/shopping_card/controller.dart';
import 'package:safe_store/app/widgets/custom_button.dart';
import 'package:safe_store/app/widgets/loading.dart';
import 'package:safe_store/constants.dart';
import 'package:safe_store/models/basket.dart';
import 'package:safe_store/models/product.dart';

class ShoppingCardScreen extends GetView<ShoppingCardController> {
  const ShoppingCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: const Color(0xFFffffff),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    controller.restaurant.value.title == null
                        ? 'You have not selected an item yet!'
                        : '${controller.restaurant.value.title} Restaurant',
                    style: fTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  controller.baskets.isEmpty
                      ? const LoadingWidget()
                      : Expanded(
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              Basket basket = controller.baskets[index];
                              Product product = controller.products
                                  .where(
                                    (i) => i.id == basket.productId,
                                  )
                                  .first;
                              return ListTile(
                                title: Text(product.name ?? ''),
                                subtitle: Text('${basket.count} Number'),
                                leading: CircleAvatar(
                                  backgroundColor: kYellowColor,
                                  child: const Icon(
                                    Icons.fastfood_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                trailing: Text(
                                  '${int.parse(product.price!) * basket.count!} \$',
                                  style: fTextStyle,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: controller.baskets.length,
                          ),
                        ),
                ],
              ),
            ),
            Positioned(
              width: Get.width - 40,
              left: 20,
              bottom: 20,
              child: CustomButton(
                text: 'Pay',
                onTapped: () {
                  Get.bottomSheet(
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Pay',
                                  style: fTextStyle,
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(CupertinoIcons.xmark),
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            const Divider(),
                            Text(
                              'The sum of your shopping cart is equal to :',
                              style: fTextStyle.copyWith(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(
                              () => Text(
                                controller.basketSum.value.toString(),
                                style: fTitleStyle,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                              text: 'Pay',
                              onTapped: () {
                                controller.checkout();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
