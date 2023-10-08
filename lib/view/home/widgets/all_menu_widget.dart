import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/view/home/page/menu_detail.dart';
import 'package:flutter_coffee_shop/view/home/widgets/card_menu.dart';
import 'package:provider/provider.dart';

import '../../../model/coffee_model.dart';
import '../../../utils/state/finite_state.dart';
import '../viewmodel/home_view_model.dart';

class AllMenuWidget extends StatefulWidget {
  const AllMenuWidget({super.key});

  @override
  State<AllMenuWidget> createState() => _AllMenuWidgetState();
}

class _AllMenuWidgetState extends State<AllMenuWidget> {
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
                        MenuDetailPage.routeName,
                        arguments: coffee,
                      );
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
