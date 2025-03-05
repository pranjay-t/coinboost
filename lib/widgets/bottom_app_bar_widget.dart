import 'package:coinboost/screens/home_screen.dart';
import 'package:coinboost/screens/rewarding_levels_screen.dart';
import 'package:flutter/material.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileHeight = MediaQuery.of(context).size.height;
    final mobileWidth = MediaQuery.of(context).size.width;
    return BottomAppBar(
      height: mobileHeight * (89 / 956),
      color: Color(0xffF7931A),
      child: Container(
        height: mobileHeight * (45 / 956),
        width: mobileWidth * (345 / 440),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false);
              },
              child: Image.asset(
                'assets/images/home.png',
                width: mobileWidth * (40 / 440),
                height: mobileHeight * (40 / 956),
              ),
            ),
            SizedBox(
              width: mobileWidth * (110 / 440),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RewardingLevelsScreen()));
              },
              child: Image.asset(
                'assets/images/app.png',
                width: mobileWidth * (45 / 440),
                height: mobileHeight * (45 / 956),
              ),
            ),
            SizedBox(
              width: mobileWidth * (110 / 440),
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/images/user.png',
                width: mobileWidth * (40 / 440),
                height: mobileHeight * (40 / 956),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
