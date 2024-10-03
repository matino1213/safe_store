import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/common/page_routes.dart';
import 'package:safe_store/app/screens/home/controller.dart';
import 'package:safe_store/models/restaurant.dart';

import '../../../constants.dart';

class SearchRestaurantScreen extends GetView<HomeController> {
  const SearchRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'SAFE STORE',
            style: fTitleStyle.copyWith(
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          FocusManager.instance.primaryFocus?.unfocus();
          Future.delayed(const Duration(milliseconds: 200));
          controller.searchController.clear();
          controller.restaurants.clear();
          return true;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Obx(
            () => Column(
              children: [
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    prefixIcon: InkWell(
                      onTap: () {
                        controller.search();
                      },
                      child: const Icon(
                        CupertinoIcons.search,
                        color: Colors.blue,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    fillColor: kLightGrayColor,
                    filled: true,
                    hintText: 'Search ...',
                  ),
                  controller: controller.searchController,
                ),
                if (controller.restaurants.isEmpty) ...[
                  Expanded(
                    child: Center(
                      child: Text(
                        'Search to find the restaurant you want.',
                        style: fTextStyle,
                      ),
                    ),
                  ),
                ] //
                else ...[
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      children:
                          List.generate(controller.restaurants.length, (index) {
                        Restaurant restaurant = controller.restaurants[index];
                        return InkWell(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Future.delayed(
                              const Duration(milliseconds: 200),
                            );
                            Get.toNamed(PageRoutes.RESTAURANT,
                                arguments: restaurant);
                          },
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: (colors..shuffle()).first,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(
                                color: kYellowColor,
                              ),
                            ),
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                              right: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  restaurant.image!,
                                  height: 60,
                                  width: Get.width,
                                  fit: BoxFit.fitWidth,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  restaurant.title!,
                                  style: fTitleStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  restaurant.address!,
                                  style: fTitleStyle.copyWith(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
