import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/widgets/shape_maker.dart';

import '../../constants.dart';


class BackgroundUi extends StatelessWidget {
  const BackgroundUi({
    super.key,
    required this.children,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: Stack(
        fit: StackFit.expand,
        children: [
          ShapeMaker(
            height: 160,
            width: 150,
            color: kLightRedColor,
            top: 0,
            right: 0,
          ),
          ShapeMaker(
            height: 140,
            width: 140,
            color: kLightGreenColor,
            top: 60,
            right: 20,
            shape: BoxShape.circle,
          ),
          ShapeMaker(
            height: 160,
            width: 160,
            color: kLightBlueColor,
            top: 0,
            right: 100,
            shape: BoxShape.circle,
          ),
          ShapeMaker(
            height: 160,
            width: 160,
            color: kLightYellowColor,
            top: 0,
            left: 0,
          ),
          ShapeMaker(
            height: 120,
            width: 120,
            color: kLightOrangeColor,
            top: 0,
            left: 80,
            shape: BoxShape.circle,
          ),
          ShapeMaker(
            height: 140,
            width: 140,
            color: kLightPurpleColor,
            top: 100,
            right: Get.width / 2 - 70,
            shape: BoxShape.circle,
          ),
          ShapeMaker(
            height: 100,
            width: 100,
            color: kLightRedColor,
            bottom: 0,
            left: 0,
          ),
          ShapeMaker(
            height: 140,
            width: 140,
            color: kLightGreenColor,
            bottom: 10,
            right: 0,
            shape: BoxShape.circle,
          ),
          ShapeMaker(
            height: 160,
            width: 160,
            color: kLightBlueColor,
            bottom: 0,
            right: 100,
            shape: BoxShape.circle,
          ),
          ShapeMaker(
            height: 100,
            width: 100,
            color: kLightYellowColor,
            bottom: 0,
            right: 0,
          ),
          ShapeMaker(
            height: 120,
            width: 120,
            color: kLightOrangeColor,
            bottom: 0,
            left: 80,
            shape: BoxShape.circle,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
            child: Container(
              color: Colors.white.withOpacity(0.1),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: crossAxisAlignment,
                      children: children,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
