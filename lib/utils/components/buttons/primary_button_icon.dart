// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../theme/my_color.dart';

class PrimaryIconButton extends StatelessWidget {
  final IconData iconData;
  final double? customWidth;
  final double? customHeight;
  final VoidCallback onPressed;
  final Color? customBackgroundColor;

  const PrimaryIconButton({
    Key? key,
    required this.iconData,
    this.customWidth,
    this.customHeight,
    required this.onPressed,
    this.customBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return kBrown;
            } else if (states.contains(MaterialState.hovered)) {
              return kBrown;
            } else if (states.contains(MaterialState.disabled)) {
              return kGrey;
            }
            return customBackgroundColor ?? kBrown;
          },
        ),
        foregroundColor: const MaterialStatePropertyAll<Color>(kWhite),
        elevation: const MaterialStatePropertyAll<double>(0),
        fixedSize: MaterialStatePropertyAll<Size>(Size(
          customWidth ?? 32,
          customHeight ?? 32,
        )),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      ),
      onPressed: () {},
      icon: Icon(
        iconData,
      ),
    );
  }
}
