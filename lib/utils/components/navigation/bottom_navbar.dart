import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/view/bag/bag_page.dart';
import 'package:flutter_coffee_shop/view/favorited/favorite_page.dart';
import 'package:flutter_coffee_shop/view/home/page/home_page.dart';
import 'package:flutter_coffee_shop/view/notification/page/notification_page.dart';
import 'package:flutter_coffee_shop/view/onboarding/onboarding_page.dart';
import 'package:flutter_coffee_shop/utils/theme/my_color.dart';

class BottomNavbar extends StatefulWidget {
  final int currentIndex;

  const BottomNavbar({
    super.key,
    required this.currentIndex,
  });

  @override
  State<BottomNavbar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: kWhite,
            width: .5,
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: kWhite,
        elevation: 0.0,
        currentIndex: widget.currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kBrown,
        unselectedItemColor: kGrey,
        unselectedLabelStyle: const TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w500,
          color: kGrey,
        ),
        selectedLabelStyle: const TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w500,
          color: kBrown,
        ),
        selectedIconTheme: const IconThemeData(color: kBrown),
        unselectedIconTheme: const IconThemeData(color: kGrey),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Order', //! ganti nama file folder page jadi Order semua
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ],
        onTap: (value) {
          if (value == widget.currentIndex) {
            return;
          }
          switch (value) {
            case 0:
              Navigator.pushReplacementNamed(context, HomePage.routeName);
              break;
            case 1:
              Navigator.pushReplacementNamed(context, FavoritePage.routeName);
              break;
            case 2:
              Navigator.pushReplacementNamed(context, BagPage.routeName);
              break;
            case 3:
              Navigator.pushNamed(context, NotificationPage.routeName);
              break;
            default:
              Navigator.pushReplacementNamed(context, OnboardingPage.routeName);
          }
        },
      ),
    );
  }
}
