// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Adbox extends StatelessWidget {
  final double boxHeight;
  final double boxWidth;
  final int price;
  final Color textColor;
  final Color cardColor;
  final double textSize;
  final bool isborder;
  const Adbox({
    super.key,
    required this.boxHeight,
    required this.boxWidth,
    required this.price,
    required this.textColor,
    required this.cardColor,
    required this.textSize,
    this.isborder = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: boxHeight,
      width: boxWidth,
      child: Card(
        elevation: isborder ? 5 : 0,
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: isborder
              ? BorderSide(color: Color(0xffF7931A), width: 1)
              : BorderSide.none,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('\$$price',
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'robotoMono',
                  color: textColor,
                )),
            Text('AD',
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'robotoMono',
                  color: textColor,
                )),
          ],
        ),
      ),
    );
  }
}
