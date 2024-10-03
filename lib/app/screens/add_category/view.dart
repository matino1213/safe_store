import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/screens/add_category/controller.dart';

import '../../../constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/my_text_field.dart';

class AddCategoryScreen extends GetView<AddCategoryController> {
  const AddCategoryScreen({super.key});

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
                'Description',
                style: fTextStyle.copyWith(color: Colors.grey),
              ),
              MyTextField(
                textEditingController: controller.descriptionController,
                height: null,
                maxLines: 3,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Add',
                onTapped: () => controller.addCategory(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
