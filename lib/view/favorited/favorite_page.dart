import 'package:flutter/material.dart';

import '../../utils/components/navigation/bottom_navbar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  static const String routeName = '/favorited';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('FAvorited Page')),
      bottomNavigationBar: BottomNavbar(
        currentIndex: 1,
      ),
    );
  }
}
