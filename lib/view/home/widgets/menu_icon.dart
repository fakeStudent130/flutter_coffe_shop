import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/utils/theme/my_color.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key, required this.icon});

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: kWhite3,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: icon,
      ),
    );
  }
}
