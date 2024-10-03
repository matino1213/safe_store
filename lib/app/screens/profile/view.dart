import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/screens/profile/controller.dart';
import 'package:safe_store/constants.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFffffff),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              child: Center(
                child: Icon(
                  CupertinoIcons.person,
                  color: kYellowColor,
                  size: 70,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              controller.name.value,
              style: fTitleStyle,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              controller.email.value,
              style: fTextStyle,
            ),
            const Spacer(),
            Material(
              color: Colors.red,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  controller.logout();
                },
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: SizedBox(
                  width: Get.width,
                  height: 70,
                  child: Center(
                    child: Text(
                      'Log Out',
                      style: fTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
