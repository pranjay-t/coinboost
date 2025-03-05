import 'package:coinboost/secrets/ad_helper.dart';
import 'package:coinboost/widgets/bottom_app_bar_widget.dart';
import 'package:coinboost/constants/rewarding_levels_card.dart';
import 'package:coinboost/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardingLevelsScreen extends StatefulWidget {
  const RewardingLevelsScreen({super.key});

  @override
  State<RewardingLevelsScreen> createState() => _RewardingLevelsScreenState();
}

class _RewardingLevelsScreenState extends State<RewardingLevelsScreen> {
  BannerAd? _bannerAd;
  @override
  void initState() {
    super.initState();
    BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          _bannerAd = ad as BannerAd;
        });
      }, onAdFailedToLoad: (ad, err) {
        print('pranjay: ${err.message}');
        ad.dispose();
      }),
      request: AdRequest(),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF7931A),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Header(title: 'Rewarding Levels'),
            SizedBox(
              height: _bannerAd != null ? 10 : 0,
            ),
            if (_bannerAd != null)
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: _bannerAd!.size.height.toDouble(),
                  width: _bannerAd!.size.width.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                ),
              ),
            SizedBox(
              height: 55,
            ),
            Column(
              children: [
                RewardingLevelsCard(
                  level: 1,
                  minimumWithdrawal: 50,
                  yourEarnings: 25,
                  isStarted: true,
                ),
                SizedBox(
                  height: 31,
                ),
                RewardingLevelsCard(
                  level: 2,
                  minimumWithdrawal: 100,
                  yourEarnings: 0,
                ),
                SizedBox(
                  height: 31,
                ),
                RewardingLevelsCard(
                  level: 3,
                  minimumWithdrawal: 150,
                  yourEarnings: 0,
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBarWidget(),
    );
  }
}
