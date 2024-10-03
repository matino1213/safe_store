import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/common/page_routes.dart';
import 'package:safe_store/app/screens/add_restaurant/controller.dart';
import 'package:safe_store/app/widgets/custom_button.dart';
import 'package:safe_store/constants.dart';

import '../../widgets/my_text_field.dart';

class AddRestaurantScreen extends GetView<AddRestaurantController> {
  const AddRestaurantScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                'Name',
                style: fTextStyle.copyWith(color: Colors.grey),
              ),
              MyTextField(textEditingController: controller.titleController),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Address',
                style: fTextStyle.copyWith(color: Colors.grey),
              ),
              MyTextField(textEditingController: controller.addressController),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Description',
                style: fTextStyle.copyWith(color: Colors.grey),
              ),
              MyTextField(
                textEditingController: controller.descriptionController,
                height: null,
                maxLines: 3,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Display for the slide on the home page',
                style: fTextStyle.copyWith(color: Colors.grey),
              ),
              Center(
                child: Obx(
                  () => SizedBox(
                    width: 100,
                    child: DropdownButton(
                      isExpanded: true,
                      value: controller.isSlide.value,
                      style: fTextStyle.copyWith(color: Colors.black),
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Yes'),
                        ),
                        DropdownMenuItem(
                          value: 0,
                          child: Text('No'),
                        ),
                      ],
                      elevation: 4,
                      underline: Container(
                        height: 2,
                        color: kYellowColor,
                      ),
                      onChanged: (int? value) {
                        controller.isSlide.value = value!;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Image',
                style: fTextStyle.copyWith(color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {
                  controller.selectImage();
                },
                child: Obx(
                  () => Center(
                    child: controller.file.value.path == '-1'
                        ? CircleAvatar(
                            radius: 40,
                            backgroundColor: kYellowColor,
                            child: const Icon(
                              Icons.add,
                              size: 36,
                              color: Colors.black,
                            ),
                          )
                        : Image.file(
                            controller.file.value,
                            width: Get.width,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Add',
                onTapped: () => controller.addRestaurant(),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Show Restaurants',
                onTapped: () => Get.toNamed(PageRoutes.SHOWRESTAURANTS),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
