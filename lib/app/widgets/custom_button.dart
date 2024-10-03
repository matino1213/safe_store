import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTapped});

  final String text;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kYellowColor,
      borderRadius: const BorderRadius.all(Radius.circular(18)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        onTap: onTapped,
        child: SizedBox(
          width: Get.width,
          height: 70,
          child: Center(
            child: Text(
              text,
              style: fTextStyle.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
