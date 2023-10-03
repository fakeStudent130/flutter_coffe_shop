import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/presentation/pages/bag_page.dart';
import 'package:flutter_coffee_shop/presentation/pages/favorite_page.dart';
import 'package:flutter_coffee_shop/presentation/pages/menu_detail.dart';
import 'package:flutter_coffee_shop/presentation/pages/notification_page.dart';
import 'package:flutter_coffee_shop/presentation/pages/onboarding_page.dart';
import 'package:flutter_coffee_shop/utils/theme/style_theme.dart';

import 'presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Coffee',
        theme: StyleTheme.themeData(),
        initialRoute: MenuDetailPage.routeName,
        routes: {
          OnboardingPage.routeName: (context) => const OnboardingPage(),
          HomePage.routeName: (context) => const HomePage(),
          MenuDetailPage.routeName: (context) => const MenuDetailPage(),
          FavoritePage.routeName: (context) => const FavoritePage(),
          BagPage.routeName: (context) => const BagPage(),
          NotificationPage.routeName: (context) => const NotificationPage(),
        });
  }
}
