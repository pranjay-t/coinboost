import 'package:flutter/material.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileHeight = MediaQuery.of(context).size.height;
    final mobileWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mobileHeight * (30 / 956),
      width: mobileWidth * (368 / 440),
      child: Row(
        children: [
          Image.asset(
            'assets/images/profile.png',
            width: mobileWidth * (30 / 440),
            height: mobileHeight * (30 / 956),
          ),
          SizedBox(
            width: mobileWidth * (5 / 440),
          ),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: mobileWidth * (14 / 440),
              fontWeight: FontWeight.w700,
              fontFamily: 'robotoMono',
              color: const Color(0xff000000),
            ),
          ),
          SizedBox(
            width: mobileWidth * (72 / 440),
          ),
          Container(
            width: mobileWidth * (25 / 440),
            height: mobileHeight * (25 / 956),
            child: Image.asset(
              'assets/images/star.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: mobileWidth * (5 / 440),
          ),
          Text(
            'Level 01',
            style: TextStyle(
              fontSize: mobileWidth * (13 / 440),
              fontWeight: FontWeight.w700,
              fontFamily: 'robotoMono',
              color: const Color(0xff000000),
            ),
          ),
          SizedBox(
            width: mobileWidth * (19 / 440),
          ),
          Container(
            width: mobileWidth * (20 / 440),
            height: mobileHeight * (20 / 956),
            child: Image.asset(
              'assets/images/wallet.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: mobileWidth * (8 / 440),
          ),
          Text(
            '\$25.00',
            style: TextStyle(
              fontSize: mobileWidth * (13 / 440),
              fontWeight: FontWeight.w700,
              fontFamily: 'robotoMono',
              color: const Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}
