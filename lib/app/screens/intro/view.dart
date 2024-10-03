import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:safe_store/app/common/page_routes.dart';
import 'package:safe_store/app/widgets/custom_button.dart';
import 'package:safe_store/constants.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final pages = [
    Container(
      color: Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.local_grocery_store,
                  size: 100, color: Colors.white),
              const SizedBox(height: 20),
              Text(
                'Welcome to Safe Store!',
                style: fTitleStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'All your grocery needs in one place.',
                style: fTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
    Container(
      color: Colors.orangeAccent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.delivery_dining, size: 100, color: Colors.white),
              const SizedBox(height: 20),
              Text('Fast Delivery', style: fTitleStyle),
              const SizedBox(height: 10),
              Text(
                'Get your groceries delivered at your doorstep.',
                style: fTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
    Container(
      color: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.local_offer, size: 100, color: Colors.white),
              const SizedBox(height: 20),
              Text(
                'Exclusive Offers',
                style: fTitleStyle,
              ),
              const SizedBox(height: 10),
              Text(
                'Save more with our exclusive deals and offers.',
                style: fTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Get.height * 0.28,
              ),
              CustomButton(
                text: 'Get Started',
                onTapped: () => Get.offAllNamed(PageRoutes.HOME),
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        fullTransitionValue: 300,
        enableLoop: true,
        waveType: WaveType.liquidReveal,
        positionSlideIcon: 0.8,
        slideIconWidget: const Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
    );
  }
}
