import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/utils/components/field/search_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String routeName = '/loginpage';

  @override
  Widget build(BuildContext context) {
    final TextEditingController username = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/onboarding.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Login form
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Username text field
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                  ),
                ),
                // Password text field
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                // Login button
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
