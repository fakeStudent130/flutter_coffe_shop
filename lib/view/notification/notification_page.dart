import 'package:flutter/material.dart';

import '../../utils/components/navigation/bottom_navbar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  static const String routeName = '/notification';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Notification Page')),
      bottomNavigationBar: BottomNavbar(
        currentIndex: 3,
      ),
    );
  }
}
