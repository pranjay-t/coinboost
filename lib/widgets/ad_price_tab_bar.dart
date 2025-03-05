import 'package:coinboost/constants/adBox.dart';
import 'package:flutter/material.dart';

class AdPriceTabBar extends StatelessWidget {
  const AdPriceTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Adbox(
          boxHeight: 30,
          boxWidth: 30,
          price: 2,
          textColor: Color(0xffffffff),
          cardColor: Color(0xffF7931A),
          textSize: 8,
        ),
        SizedBox(
          width: 11,
        ),
        Adbox(
          boxHeight: 40,
          boxWidth: 40,
          price: 2,
          textColor: Color(0xffffffff),
          cardColor: Color(0xffF7931A),
          textSize: 9,
        ),
        SizedBox(
          width: 11,
        ),
        Adbox(
          boxHeight: 50,
          boxWidth: 50,
          price: 2,
          textColor: Color(0xffffffff),
          cardColor: Color(0xffF7931A),
          textSize: 11,
        ),
        SizedBox(
          width: 11,
        ),
        Adbox(
          boxHeight: 62,
          boxWidth: 62,
          price: 2,
          cardColor: Color(0xffffffff),
          textColor: Color(0xffF7931A),
          textSize: 15,
          isborder: true,
        ),
        SizedBox(
          width: 11,
        ),
        Adbox(
          boxHeight: 50,
          boxWidth: 50,
          price: 2,
          textColor: Color(0xffffffff),
          cardColor: Color(0xffF7931A),
          textSize: 11,
        ),
        SizedBox(
          width: 11,
        ),
        Adbox(
          boxHeight: 40,
          boxWidth: 40,
          price: 2,
          textColor: Color(0xffffffff),
          cardColor: Color(0xffF7931A),
          textSize: 9,
        ),
        SizedBox(
          width: 11,
        ),
        Adbox(
          boxHeight: 30,
          boxWidth: 30,
          price: 2,
          textColor: Color(0xffffffff),
          cardColor: Color(0xffF7931A),
          textSize: 8,
        ),
      ],
    );
  }
}
