import 'package:flutter/material.dart';

class HomeCards extends StatelessWidget {
  final String imgPath;
  final String title;
  final int price;
  final VoidCallback onPressed;
  const HomeCards(
      {super.key,
      required this.imgPath,
      required this.title,
      required this.price,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final mobileHeight = MediaQuery.of(context).size.height;
    final mobileWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 185,
      width: mobileWidth * (358 / 440),
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imgPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: mobileHeight * (45 / 956),
                    width: mobileWidth * (351 / 440),
                    decoration: BoxDecoration(
                      color: Color(0xFFffffff).withOpacity(0.88),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Container(
                      height: mobileHeight * (17 / 956),
                      width: mobileWidth * (237 / 440),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'robotoMono',
                              color: const Color(0xff000000),
                            ),
                          ),
                          SizedBox(
                            width: mobileWidth * (80 / 440),
                          ),
                          Text(
                            '\$$price',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'robotoMono',
                              color: const Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
