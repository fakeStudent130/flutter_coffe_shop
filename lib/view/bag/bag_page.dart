import 'package:flutter/material.dart';

import '../../utils/components/navigation/bottom_navbar.dart';

class BagPage extends StatelessWidget {
  const BagPage({super.key});

  static const String routeName = '/bag';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Bag Page')),
      bottomNavigationBar: BottomNavbar(
        currentIndex: 2,
      ),
    );
  }
}
