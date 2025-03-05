import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  
  const Header({super.key, required this.title,});

  @override
  Widget build(BuildContext context) {
    final mobileHeight = MediaQuery.of(context).size.height;
    final mobileWidth = MediaQuery.of(context).size.width;
    return Row(
            children: [
              SizedBox(
                width: mobileWidth * (40 / 440),
              ),
              GestureDetector(
                onTap: ()=> Navigator.pop(context),
                child: Image.asset(
                  'assets/images/Back.png',
                  width: mobileWidth * (40 / 440),
                  height: mobileHeight * (40 / 956),
                ),
              ),
              SizedBox(
                width: mobileWidth * (70 / 440),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'robotoMono',
                  color: const Color(0xffF7931A),
                ),
              ),
            ],
          );
  }
}