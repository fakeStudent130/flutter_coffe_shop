import 'package:flutter/material.dart';
// import 'package:flutter_coffee_shop/presentation/pages/menu_detail.dart';
import 'package:flutter_coffee_shop/utils/components/buttons/primary_button.dart';
import 'package:flutter_coffee_shop/utils/components/buttons/primary_button_icon.dart';
import 'package:flutter_coffee_shop/utils/components/field/search_field.dart';
import 'package:flutter_coffee_shop/utils/theme/my_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 360,
            child: Stack(
              children: [
                Container(
                  color: const Color.fromARGB(255, 24, 24, 24),
                  height: 280,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 30, left: 30, top: 65),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hello!",
                                    style: TextStyle(
                                      color: Color(0xffB7B7B7),
                                    ),
                                  ),
                                  Text(
                                    "Yusman Developer",
                                    style: TextStyle(
                                      color: Color(0xffDDDDDD),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 44,
                                width: 44,
                                child: Image.asset("assets/images/Image.png"),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: SearchField(
                            textEditingController: _searchController,
                            hintText: 'Search coffee',
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 210,
                  left: 30,
                  right: 30,
                  child: GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: const Image(
                              image: AssetImage('assets/images/image 8.png'),
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 13,
                            left: 23,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xffED5151),
                              ),
                              width: 60,
                              height: 26,
                              child: const Center(
                                child: Text(
                                  "Promo",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 40,
                            left: 23,
                            child: SizedBox(
                              width: 203,
                              child: Center(
                                child: Text(
                                  "Buy one get one FREE",
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: kBrown,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 30),
                PrimaryButton(
                  teks: 'Cappuccino',
                  customWidth: 150,
                  customHeight: 50,
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                PrimaryButton(
                  teks: 'Machiato',
                  customWidth: 125,
                  customHeight: 50,
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                PrimaryButton(
                  teks: 'Latte',
                  customWidth: 90,
                  customHeight: 50,
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                PrimaryButton(
                  teks: 'Arabica',
                  customWidth: 115,
                  customHeight: 50,
                  onPressed: () {},
                ),
                const SizedBox(width: 30),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 24),
            child: Container(
              width: 149,
              height: 239,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 0),
                    color:
                        Color.fromARGB(0.25.toInt(), 0, 0, 0).withOpacity(0.2),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Stack(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/Rectangle 1706.png'),
                        ),
                        Container(
                          width: 51,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0),
                                color: Color.fromARGB(0.8.toInt(), 0, 0, 0)
                                    .withOpacity(0.5),
                                blurRadius: 0,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 8),
                              SvgPicture.asset(
                                'assets/icons/star.svg',
                              ),
                              const SizedBox(width: 2),
                              const Text(
                                "4.9",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: kWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Cappuccino",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kBlack,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "with Chocolate",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff9d9d9d),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "\$ 4.00",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff2F4B4E),
                            ),
                          ),
                          PrimaryIconButton(
                            iconData: Icons.add,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavbar(
        currentIndex: 0,
      ),
    );
  }
}
