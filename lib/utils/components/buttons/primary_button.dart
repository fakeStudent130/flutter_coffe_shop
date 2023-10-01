import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/utils/theme/my_color.dart';

import '../../const/my_size.dart';

class PrimaryButton extends StatelessWidget {
  final String teks;
  final double? customWidth;
  final double? customHeight;
  final Color? customBackgroundColor;
  final Color? customTextColor;
  final void Function()? onPressed;
  final Widget? customChild;

  const PrimaryButton({
    super.key,
    this.customWidth,
    this.customHeight,
    this.customBackgroundColor,
    this.customTextColor,
    this.customChild,
    required this.teks,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
          customWidth == null ? MySize().screenWidth(context) : customWidth!,
          customHeight == null ? 66 : customHeight!,
        )),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      ),
      onPressed: onPressed,
      child: customChild ??
          Text(
            teks,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: customTextColor ?? kWhite,
            ),
          ),
    );
  }
}
