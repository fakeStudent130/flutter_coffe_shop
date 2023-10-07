import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/view/bag/bag_page.dart';
import 'package:flutter_coffee_shop/view/favorited/favorite_page.dart';
import 'package:flutter_coffee_shop/view/home/page/menu_detail.dart';
import 'package:flutter_coffee_shop/view/notification/notification_page.dart';
import 'package:flutter_coffee_shop/view/onboarding/onboarding_page.dart';
import 'package:flutter_coffee_shop/utils/theme/style_theme.dart';
import 'package:provider/provider.dart';

import 'view/home/page/home_page.dart';
import 'view/home/viewmodel/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
          title: 'Flutter Coffee',
          theme: StyleTheme.themeData(),
          initialRoute: OnboardingPage.routeName,
          routes: {
            OnboardingPage.routeName: (context) => const OnboardingPage(),
            HomePage.routeName: (context) => const HomePage(),
            MenuDetailPage.routeName: (context) => const MenuDetailPage(),
            FavoritePage.routeName: (context) => const FavoritePage(),
            BagPage.routeName: (context) => const BagPage(),
            NotificationPage.routeName: (context) => const NotificationPage(),
          }),
    );
  }
}
