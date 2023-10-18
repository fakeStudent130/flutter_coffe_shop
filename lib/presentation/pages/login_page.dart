import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/presentation/pages/home_page.dart';
import 'package:flutter_coffee_shop/presentation/pages/regis_page.dart';
import 'package:flutter_coffee_shop/utils/components/buttons/primary_button.dart';
import 'package:flutter_coffee_shop/utils/components/field/search_field.dart';
import 'package:flutter_coffee_shop/utils/theme/my_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String routeName = '/loginpage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 30),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login_regis.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Welcome,",
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Kopi Bara",
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "Caption",
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            color: kBlack1,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kBrown, width: 2)),
                        child: const TextField(
                          decoration: InputDecoration(
                              hintText: "Username",
                              hintStyle: TextStyle(color: kBlack2),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            color: kBlack1,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kBrown, width: 2)),
                        child: const TextField(
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: kBlack2),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PrimaryButton(
                          teks: 'Login',
                          customHeight: 42,
                          onPressed: () {
                            Navigator.pushNamed(context, HomePage.routeName);
                          }),
                      const SizedBox(
                        height: 13,
                      ),
                      const Text(
                        "Forgot Password?",
                        style: TextStyle(color: kBlue),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          padding: const EdgeInsets.only(left: 55),
                          child: Row(
                            children: [
                              const Text("Don't have an account? ",
                                  style: TextStyle(color: kBlack)),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RegisPage.routeName);
                                  },
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(color: kBlue),
                                  ))
                            ],
                          )),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                          padding: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              color: kBlack3,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: kBrown, width: 2)),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 44,
                                width: 44,
                                child: Image.asset(
                                    "assets/images/google-logo.png"),
                              ),
                              const Text("Log in with Google")
                            ],
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              color: kBlack3,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: kBrown, width: 2)),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 44,
                                width: 44,
                                child: Image.asset(
                                    "assets/images/facebook-logo.png"),
                              ),
                              const Text("Log in with Facebook")
                            ],
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              color: kBlack3,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: kBrown, width: 2)),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 44,
                                width: 44,
                                child:
                                    Image.asset("assets/images/apple-logo.png"),
                              ),
                              const Text("Log in with Apple")
                            ],
                          )),
                    ],
                  ),
                ),
              )),
            ]),
      ),
    );
  }
}
