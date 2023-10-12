import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/model/coffee_model.dart';
import 'package:flutter_coffee_shop/view/home/viewmodel/detail_menu_view_model.dart';
import 'package:flutter_coffee_shop/view/home/widgets/menu_icon.dart';
import 'package:flutter_coffee_shop/utils/components/buttons/button_outline.dart';
import 'package:flutter_coffee_shop/utils/const/my_size.dart';
import 'package:flutter_coffee_shop/utils/theme/my_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../../utils/components/buttons/primary_button.dart';
import '../../../utils/formatter/money_formatter.dart';

class DetailMenuPage extends StatefulWidget {
  const DetailMenuPage({super.key});

  static const String routeName = '/detailmenu';

  @override
  State<DetailMenuPage> createState() => _DetailMenuPageState();
}

class _DetailMenuPageState extends State<DetailMenuPage> {
  @override
  Widget build(BuildContext context) {
    final CoffeeModel args =
        ModalRoute.of(context)!.settings.arguments as CoffeeModel;

    final MoneyFormatter moneyFormatter = MoneyFormatter();

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
          Consumer<DetailMenuViewModel>(
            builder: (context, value, child) {
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  //! versi ysng menggunakan svg
                  // child: SvgPicture.asset(
                  //   'assets/icons/Heart.svg',
                  //   colorFilter: value.isFavorite
                  //       ? const ColorFilter.mode(kRed, BlendMode.srcIn)
                  //       : const ColorFilter.mode(kBlack, BlendMode.srcIn),
                  // ),

                  child: Icon(
                    value.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: value.iconColor,
                  ),
                ),
                onTap: () {
                  value.changeFavorite();
                  log('Tap Favorite');
                },
              );
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
                  child: Image(
                    image: NetworkImage(
                      args.imgUrl!,
                    ),
                    width: double.infinity,
                    height: 226,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  args.category!,
                  style: const TextStyle(
                    color: kBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  args.menu!,
                  style: const TextStyle(
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
                        Text(
                          args.rating.toString(),
                          style: const TextStyle(
                            color: kBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${args.reviewer})',
                          style: const TextStyle(
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
                ReadMoreText(
                  args.description!,
                  trimLines: 3,
                  colorClickableText: kBrown,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read More',
                  trimExpandedText: 'Show Less',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: kGrey3,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  moreStyle: const TextStyle(
                    color: kBrown,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  lessStyle: const TextStyle(
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
                width: MediaQuery.sizeOf(context).width * 0.3,
                color: kWhite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Price",
                      style: TextStyle(
                        color: kGrey3,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        // ' ${args.price}',
                        moneyFormatter.formatRupiah(
                          args.price!.toDouble(),
                        ),
                        style: TextStyle(
                          color: kBrown,
                          fontSize: MediaQuery.sizeOf(context).width * 0.05,
                          fontWeight: FontWeight.w600,
                        ),
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
