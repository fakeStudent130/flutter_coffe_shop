import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/view/home/page/home_page.dart';
import 'package:flutter_coffee_shop/utils/theme/my_color.dart';

import '../../utils/components/buttons/primary_button.dart';
import '../../utils/const/my_size.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const String routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const Expanded(
            child: Image(
              image: AssetImage('assets/images/onboarding.png'),
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          const Text(
            'Coffee so good,\nyour taste buds\nwill love it.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kWhite,
              fontWeight: FontWeight.w600,
              fontSize: 34,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'The best grain, the finest roast,\nthe powerful flavor.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kGrey2,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MySize.screenPadding,
              vertical: 12,
            ),
            child: PrimaryButton(
              teks: 'Get Started',
              onPressed: () {
                Navigator.pushNamed(context, HomePage.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
