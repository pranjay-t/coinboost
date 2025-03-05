import 'package:coinboost/constants/home_cards.dart';
import 'package:coinboost/screens/read_news.dart';
import 'package:coinboost/widgets/ad_price_tab_bar.dart';
import 'package:coinboost/widgets/bottom_app_bar_widget.dart';
import 'package:coinboost/widgets/profile_tab_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileHeight = MediaQuery.of(context).size.height;
    final mobileWidth = MediaQuery.of(context).size.width;
    print(mobileWidth * (345 / 440));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF7931A),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: mobileHeight * (26 / 956),
              ),
              ProfileBar(),
              SizedBox(
                height: mobileHeight * (62 / 956),
              ),
              Container(
                height: 128,
                width: 375,
                child: Column(
                  children: [
                    Text('Claim your Daily Reward',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'roboto',
                          color: const Color(0xff965200),
                        )),
                    SizedBox(
                      height: mobileHeight * (15 / 956),
                    ),
                    AdPriceTabBar(),
                  ],
                ),
              ),
              SizedBox(
                height: mobileHeight * (30 / 956),
              ),
              Text(
                'Do Tasks, Earn Reward',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'roboto',
                  color: const Color(0xff965200),
                ),
              ),
              SizedBox(
                height: mobileHeight * (12 / 956),
              ),
              Text(
                'You can do these tasks as many times',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'roboto',
                  color: const Color(0xff0D0D0D),
                ),
              ),
              Text(
                'as you want to',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'roboto',
                  color: const Color(0xff0D0D0D),
                ),
              ),
              SizedBox(
                height: mobileHeight * (37 / 956),
              ),
              HomeCards(
                onPressed: () {},
                imgPath: 'assets/images/play_game.png',
                title: 'Play Game',
                price: 10,
              ),
              SizedBox(
                height: mobileHeight * (37 / 956),
              ),
              HomeCards(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReadNews())),
                imgPath: 'assets/images/news.png',
                title: 'Read News',
                price: 5,
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBarWidget(),
    );
  }
}
