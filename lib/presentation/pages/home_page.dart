import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/presentation/pages/menu_detail.dart';
import 'package:flutter_coffee_shop/utils/components/buttons/primary_button.dart';
import 'package:flutter_coffee_shop/utils/components/buttons/primary_button_icon.dart';
import 'package:flutter_coffee_shop/utils/components/field/search_field.dart';

import '../../utils/components/navigation/bottom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/home';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PrimaryButton(
              teks: 'Get Started',
              onPressed: () {
                Navigator.pushNamed(context, MenuDetailPage.routeName);
              },
            ),
            const SizedBox(
              height: 60,
            ),
            PrimaryIconButton(
              iconData: Icons.add,
              onPressed: () {},
            ),
            const SizedBox(
              height: 60,
            ),
            SearchField(
              textEditingController: _searchController,
              hintText: 'Search coffee',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(
        currentIndex: 0,
      ),
    );
  }
}