import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/components/buttons/primary_button_icon.dart';
import '../../../utils/formatter/money_formatter.dart';
import '../../../utils/theme/my_color.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({
    super.key,
    required this.menu,
    required this.rating,
    required this.category,
    required this.reviewer,
    required this.price,
    required this.imageUrl,
    required this.onPressedCard,
    required this.onPressedIcon,
  });

  final String menu;
  final double rating;
  final String category;
  final String reviewer;
  final double price;
  final String imageUrl;
  final void Function()? onPressedCard;
  final void Function() onPressedIcon;

  @override
  Widget build(BuildContext context) {
    final MoneyFormatter moneyFormatter = MoneyFormatter();
    return InkWell(
      onTap: onPressedCard,
      child: Container(
        width: 148,
        height: 238,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: Color.fromARGB(0.25.toInt(), 0, 0, 0).withOpacity(0.2),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image(
                      image: NetworkImage(
                        imageUrl,
                      ),
                      width: double.infinity,
                      height: 132,
                      fit: BoxFit.cover,
                    ),
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
                        Text(
                          rating.toString(),
                          style: const TextStyle(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                category,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: kBlack,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                menu,
                style: const TextStyle(
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
                    Text(
                      moneyFormatter.formatRupiah(
                        price,
                      ),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff2F4B4E),
                      ),
                    ),
                    PrimaryIconButton(
                      iconData: Icons.add,
                      onPressed: onPressedIcon,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
