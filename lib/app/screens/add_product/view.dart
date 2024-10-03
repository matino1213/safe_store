import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/common/page_routes.dart';
import 'package:safe_store/app/screens/add_product/controller.dart';

import '../../../constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/my_text_field.dart';

class AddProductScreen extends GetView<AddProductController> {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Category',
          style: fTitleStyle.copyWith(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                'Name',
                style: fTextStyle.copyWith(color: Colors.grey),
              ),
              MyTextField(textEditingController: controller.nameController),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Price',
                style: fTextStyle.copyWith(color: Colors.grey),
              ),
              MyTextField(
                textEditingController: controller.priceController,
                textInputType: const TextInputType.numberWithOptions(),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Restaurant',
                style: fTextStyle.copyWith(color: Colors.grey),
              ),
              Center(
                child: Obx(
                  () => DropdownButton(
                    value: controller.restaurantValue.value,
                    style: fTextStyle.copyWith(color: Colors.black),
                    items: controller.restaurantList,
                    elevation: 4,
                    underline: Container(
                      height: 2,
                      color: kYellowColor,
                    ),
                    onChanged: (value) {
                      controller.restaurantValue.value = value!;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Category',
                style: fTextStyle.copyWith(color: Colors.grey),
              ),
              Center(
                child: Obx(
                  () => DropdownButton(
                    value: controller.categoryValue.value,
                    style: fTextStyle.copyWith(color: Colors.black),
                    items: controller.categoryList,
                    elevation: 4,
                    underline: Container(
                      height: 2,
                      color: kYellowColor,
                    ),
                    onChanged: (value) {
                      controller.categoryValue.value = value!;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Add',
                onTapped: () => controller.addProduct(),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Show product list',
                onTapped: () => Get.toNamed(PageRoutes.SHOWPRODUCTLIST),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
