import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../model/coffee_model.dart';
import '../../../utils/state/finite_state.dart';
import '../page/detail_menu.dart';
import '../viewmodel/home_view_model.dart';
import 'card_menu.dart';

class MenuByCategoryWidget extends StatefulWidget {
  const MenuByCategoryWidget({
    super.key,
  });

  @override
  State<MenuByCategoryWidget> createState() => _MenuByCategoryWidgetState();
}

class _MenuByCategoryWidgetState extends State<MenuByCategoryWidget> {
  CoffeeModel? homeProvider;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) {
        if (value.state == MyState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (value.state == MyState.loaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GridView.builder(
              itemCount: value.coffeeList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                final coffee = value.coffeeList[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      homeProvider = homeProvider;
                    });
                  },
                  child: CardMenu(
                    menu: coffee.menu!,
                    rating: coffee.rating!,
                    category: coffee.category!,
                    reviewer: coffee.reviewer!,
                    price: coffee.price!.toDouble(),
                    imageUrl: coffee.imgUrl!,
                    onPressedCard: () {
                      Navigator.pushNamed(
                        context,
                        DetailMenuPage.routeName,
                        arguments: coffee,
                      );
                      log('id: ${coffee.id}');
                    },
                    onPressedIcon: () {
                      //! buat disini untuk menambahkan item ke cart
                    },
                  ),
                );
              },
            ),
          );
        } else if (value.state == MyState.failed) {
          return Center(
            child: Image.asset(
              'assets/images/404-error.png',
              width: 200,
              height: 200,
            ),
          );
        } else {
          return Center(
            child: Image.asset(
              'assets/images/404-error.png',
              width: 200,
              height: 200,
            ),
          );
        }
      },
    );
  }
}
