import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/screens/home/controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSlider extends GetView<HomeController> {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.imageSliders.isNotEmpty,
        child: SizedBox(
          width: Get.width,
          height: 200,
          child: Stack(
            children: [
              SizedBox(
                width: Get.width,
                child: CarouselSlider(
                  items: controller.imageSliders,
                  carouselController: controller.sliderController.value,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.2,
                      onPageChanged: (index, reason) {
                        controller.currentSlide.value = index;
                      }),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomCenter,
                child: AnimatedSmoothIndicator(
                  activeIndex: controller.currentSlide.value,
                  count: controller.restaurantImages.length,
                  axisDirection: Axis.horizontal,
                  effect: const ExpandingDotsEffect(
                      spacing: 8.0,
                      radius: 10.0,
                      dotWidth: 14.0,
                      dotHeight: 14.0,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
