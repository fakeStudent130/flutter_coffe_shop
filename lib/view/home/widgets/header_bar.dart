import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    super.key,
    required this.name,
    required this.urlProfile,
  });

  final String name;
  final String urlProfile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello!",
              style: TextStyle(
                color: Color(0xffB7B7B7),
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                color: Color(0xffDDDDDD),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 44,
          width: 44,
          child: Image.asset(urlProfile),
        )
      ],
    );
  }
}
