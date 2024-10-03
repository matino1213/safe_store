import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_store/app/screens/home/controller.dart';
import 'package:safe_store/app/widgets/loading.dart';
import 'package:safe_store/app/widgets/show_categories.dart';

import '../../constants.dart';
import '../screens/search_restaurant/view.dart';
import 'best_restaurant.dart';
import 'custom_slider.dart';
import 'new_restaurants.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.restaurants.isEmpty
        ? const LoadingWidget()
        : Container(
      color: const Color(0xFFffffff),
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: OpenContainer(
                      closedBuilder:
                          (BuildContext context, void Function() action) {
                        return TextField(
                          enabled: false,
                          onTap: () {},
                          decoration: InputDecoration(
                            prefixIcon: const Icon(CupertinoIcons.search),
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
                        );
                      },
                      openBuilder: (BuildContext context,
                          void Function({Object? returnValue}) action) {
                        return const SearchRestaurantScreen();
                      },
                      closedElevation: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomSlider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Best Restaurant',
                      style: fTextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const BestRestaurants(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.fastfood_outlined),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Categories',
                          style: fTextStyle,
                        ),
                      ],
                    ),
                  ),
                  const ShowCategories(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'New Restaurant',
                      style: fTextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const NewRestaurants(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
        );
  }
}
