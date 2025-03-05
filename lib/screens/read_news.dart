import 'package:coinboost/secrets/ad_helper.dart';
import 'package:coinboost/screens/task_screen.dart';
import 'package:coinboost/widgets/bottom_app_bar_widget.dart';
import 'package:coinboost/widgets/header.dart';
import 'package:coinboost/widgets/rules.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ReadNews extends StatefulWidget {
  const ReadNews({super.key});

  @override
  State<ReadNews> createState() => _ReadNewsState();
}

class _ReadNewsState extends State<ReadNews> {
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;
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
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {},
          );
          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('pranjay: ${err.message}');
          // ad.dispose();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mobileHeight = MediaQuery.of(context).size.height;
    final mobileWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF7931A),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: mobileHeight * (25 / 956),
            ),
            Header(
              title: 'Read News',
            ),
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
              height: mobileHeight * (82 / 956),
            ),
            Container(
              width: mobileWidth * (358 / 440),
              height: 185,
              child: Card(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/news.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: mobileHeight * (59 / 956),
            ),
            Rules(),
            SizedBox(
              height: mobileHeight * (42 / 956),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: mobileWidth * (41 / 440)),
                  child: Container(
                    width: 192.36,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        _interstitialAd?.show();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TaskScreen()));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(const Color(0xffF7931A)),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        'Start Task',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'robotoMono',
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBarWidget(),
    );
  }
}
