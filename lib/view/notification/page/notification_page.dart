import 'package:flutter/material.dart';

import '../../../utils/components/navigation/bottom_navbar.dart';
import '../../../utils/theme/my_color.dart';
import '../widgets/card_notif.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  static const String routeName = '/notification';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        leading: GestureDetector(
          child: const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Notification',
          style: TextStyle(
            color: kBlack,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () {
                debugPrint('tap profile');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                clipBehavior: Clip.antiAlias,
                child: const Image(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1475566718667-b6fe2e251c6b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
                  ),
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Today',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: kBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 32),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return const CardNotif(
                  imgUrl:
                      'https://images.unsplash.com/photo-1475566718667-b6fe2e251c6b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
                  menu: 'Cappucino',
                  message:
                      'Pesanan kopi Anda telah berhasil diterima. Mohon tunggu sebentar!',
                  date: '1m ago.',
                );
              },
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'This Week',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: kBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 32),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return const CardNotif(
                  imgUrl:
                      'https://images.unsplash.com/photo-1475566718667-b6fe2e251c6b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
                  menu: 'Cappucino',
                  message:
                      'Pesanan kopi Anda telah berhasil diterima. Mohon tunggu sebentar!',
                  date: '1m ago.',
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(
        currentIndex: 3,
      ),
    );
  }
}
