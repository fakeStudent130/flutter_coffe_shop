import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/my_color.dart';

class SearchField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final bool? autoFocus;
  final String? obscureChar;
  final bool? obscureText;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final int? errorMaxLines;
  final int? hintMaxLines;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final FocusNode? currentFocus;
  final bool? last;
  final void Function(String)? onFieldSubmitted;
  final double? width;
  final Widget? suffixIcon;

  const SearchField({
    super.key,
    this.width,
    required this.textEditingController,
    required this.hintText,
    this.onFieldSubmitted,
    this.currentFocus,
    this.last,
    this.keyboardType,
    this.textCapitalization,
    this.autoFocus,
    this.obscureChar,
    this.obscureText,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    this.errorMaxLines,
    this.hintMaxLines,
    this.inputFormatters,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: textEditingController,
        focusNode: currentFocus,
        onFieldSubmitted: last == true
            ? (value) {
                currentFocus!.unfocus();
              }
            : onFieldSubmitted,
        textInputAction: last == null || last == false
            ? TextInputAction.next
            : TextInputAction.done,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization == null
            ? TextCapitalization.none
            : textCapitalization!,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: kWhite,
        ),
        autofocus: autoFocus == null || autoFocus == false ? false : true,
        obscureText: obscureText == null || obscureText == false ? false : true,
        obscuringCharacter:
            obscureText == null || obscureText == false || obscureChar == ''
                ? '*'
                : obscureChar!,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 20,
              height: 20,
            ),
          ),
          fillColor: kBrown2,
          filled: true,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14.0,
            horizontal: 15.0,
          ),
          isDense: true,
          errorMaxLines: errorMaxLines,
          hintMaxLines: hintMaxLines,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: kGrey,
          ),
          errorStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.red,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: kGrey),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kBlack),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        inputFormatters: inputFormatters,
        validator: validator,
      ),
    );
  }
}
