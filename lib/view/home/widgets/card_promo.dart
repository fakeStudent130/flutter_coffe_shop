import 'package:flutter/material.dart';

import '../../../utils/theme/my_color.dart';

class CardPromo extends StatelessWidget {
  const CardPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 210,
      left: 30,
      right: 30,
      bottom: 4,
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
    );
  }
}
