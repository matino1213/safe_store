import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/models/restaurant.dart';

import '../../../constants.dart';

class ShowRestaurantScreen extends GetView {
  ShowRestaurantScreen({super.key});

  Restaurant restaurant = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${restaurant.title} Restaurant',
          style: fTitleStyle.copyWith(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              restaurant.image!,
              width: Get.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            ListTile(
              title: const Text(
                'Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(restaurant.title!),
              leading: const Icon(Icons.drive_file_rename_outline),
            ),
            ListTile(
              title: const Text(
                'Address',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(restaurant.address!),
              leading: const Icon(CupertinoIcons.map),
            ),
            ListTile(
              title: const Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(restaurant.description!),
              leading: const Icon(Icons.description_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
