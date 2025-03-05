import 'package:coinboost/secrets/ad_helper.dart';
import 'package:coinboost/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  BannerAd? _bannerAd;
  late AnimationController _logoController;
  late AnimationController _fadeController;
  late AnimationController _buttonController;

  late Animation<double> _logoAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _buttonSlideAnimation;

  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('pranjay: ${err.message}');
          ad.dispose();
        },
      ),
      request: AdRequest(),
    ).load();

    _logoController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _logoAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeOutBack,
    );
    _logoController.forward();

    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
    Future.delayed(Duration(milliseconds: 300), () {
      _fadeController.forward();
    });

    _buttonController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _buttonSlideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeOut),
    );
    Future.delayed(Duration(milliseconds: 600), () {
      _buttonController.forward();
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _fadeController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mobileHeight = MediaQuery.of(context).size.height;
    final mobileWidth = MediaQuery.of(context).size.width;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 0,
        color: Color(0xff040302).withOpacity(0.26),
      ),
    );

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.only(
            top: mobileHeight * 0.1,
            left: mobileWidth * 0.15,
            right: mobileWidth * 0.15,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (_bannerAd != null)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: _bannerAd!.size.height.toDouble(),
                      width: _bannerAd!.size.width.toDouble(),
                      child: AdWidget(ad: _bannerAd!),
                    ),
                  ),
                ScaleTransition(
                  scale: _logoAnimation,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/splash_logo.png',
                        width: mobileWidth * 0.4,
                        height: mobileHeight * 0.2,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'COINBOOST',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'robotoMono',
                          color: const Color(0xffF7931A),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: mobileHeight * 0.05),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/savings_logo.png',
                        height: mobileHeight * 0.25,
                      ),
                      SizedBox(height: mobileHeight * 0.08),
                      Card(
                        elevation: 6,
                        child: TextField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                            hintText: 'Enter Your Mobile Number',
                            hintStyle: TextStyle(
                              fontFamily: 'robotoMono',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xff040302).withOpacity(0.26),
                            ),
                            enabledBorder: border,
                            focusedBorder: border,
                            border: border,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: mobileHeight * 0.04),
                SlideTransition(
                  position: _buttonSlideAnimation,
                  child: Container(
                    height: 48,
                    width: 307,
                    child: ElevatedButton(
                      onPressed: () {
                        if (textEditingController.text.trim().length == 10) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        } else {
                          Fluttertoast.showToast(
                            msg: "Please enter a valid phone number!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            backgroundColor: Colors.white,
                            textColor: Colors.red,
                            fontSize: 16.0,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF7931A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'robotoMono',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
