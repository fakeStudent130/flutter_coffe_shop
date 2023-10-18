import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/presentation/pages/login_page.dart';
import 'package:flutter_coffee_shop/presentation/pages/regis_page.dart';
import 'package:flutter_coffee_shop/view/bag/bag_page.dart';
import 'package:flutter_coffee_shop/view/favorited/favorite_page.dart';
import 'package:flutter_coffee_shop/view/home/page/detail_menu.dart';
import 'package:flutter_coffee_shop/view/onboarding/onboarding_page.dart';
import 'package:flutter_coffee_shop/utils/theme/style_theme.dart';
import 'package:provider/provider.dart';

import 'view/home/page/home_page.dart';
import 'view/home/viewmodel/detail_menu_view_model.dart';
import 'view/home/viewmodel/home_view_model.dart';
import 'view/notification/page/notification_page.dart';

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
        ChangeNotifierProvider(create: (_) => DetailMenuViewModel())
      ],
      child: MaterialApp(
          title: 'Flutter Coffee',
          theme: StyleTheme.themeData(),
          initialRoute: OnboardingPage.routeName,
          routes: {
            OnboardingPage.routeName: (context) => const OnboardingPage(),
            LoginPage.routeName: (context) => const LoginPage(),
            RegisPage.routeName: (context) => const RegisPage(),
            HomePage.routeName: (context) => const HomePage(),
            DetailMenuPage.routeName: (context) => const DetailMenuPage(),
            FavoritePage.routeName: (context) => const FavoritePage(),
            BagPage.routeName: (context) => const BagPage(),
            NotificationPage.routeName: (context) => const NotificationPage(),
          }),
    );
  }
}
