import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/view/home/widgets/menu_icon.dart';
import 'package:flutter_coffee_shop/utils/components/buttons/button_outline.dart';
import 'package:flutter_coffee_shop/utils/const/my_size.dart';
import 'package:flutter_coffee_shop/utils/theme/my_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';

import '../../../utils/components/buttons/primary_button.dart';

class MenuDetailPage extends StatefulWidget {
  const MenuDetailPage({super.key});

  static const String routeName = '/menudetail';

  @override
  State<MenuDetailPage> createState() => _MenuDetailPageState();
}

class _MenuDetailPageState extends State<MenuDetailPage> {
  //  final provider = Provider.of<MenuDetailProvider>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite2,
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
          'Detail',
          style: TextStyle(
            color: kBlack,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: SvgPicture.asset(
                'assets/icons/Heart.svg',
                colorFilter: const ColorFilter.mode(kBlack, BlendMode.srcIn),
              ),
            ),
            onTap: () {
              log('Tap Favorited Button');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: MySize.screenPadding),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: const Image(
                    image: NetworkImage('https://picsum.photos/id/63/200/300'),
                    width: double.infinity,
                    height: 226,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Cappuccino',
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'with Chocolate',
                  style: TextStyle(
                    color: kGrey3,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Rating.svg',
                          colorFilter:
                              const ColorFilter.mode(kYellow, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '4.8',
                          style: TextStyle(
                            color: kBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '(230)',
                          style: TextStyle(
                            color: kGrey3,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MenuIcon(
                          icon: ImageIcon(
                            AssetImage(
                              'assets/icons/bean.png',
                            ),
                            color: kBrown,
                          ),
                        ),
                        SizedBox(width: 12),
                        MenuIcon(
                          icon: ImageIcon(
                            AssetImage(
                              'assets/icons/milk.png',
                            ),
                            color: kBrown,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: kGrey3,
                  thickness: 1,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Description',
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                const ReadMoreText(
                  'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo',
                  trimLines: 3,
                  colorClickableText: kBrown,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read More',
                  trimExpandedText: 'Show Less',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: kGrey3,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  moreStyle: TextStyle(
                    color: kBrown,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  lessStyle: TextStyle(
                    color: kBrown,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Size',
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonOutlined(text: 'S'),
                    ButtonOutlined(text: 'M'),
                    ButtonOutlined(text: 'L'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 87,
        decoration: const BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
              child: Container(
                width: 66,
                color: kWhite,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                        color: kGrey3,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '\$ 4.53',
                      style: TextStyle(
                        color: kBrown,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                child: PrimaryButton(
                  teks: 'Buy Now',
                  onPressed: () {
                    log('Tap Checkout');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
