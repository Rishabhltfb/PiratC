import 'package:flutter/material.dart';
import 'home.dart';
import 'package:hexcolor/hexcolor.dart';
import 'home.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroductionPage(),
    );
  }
}

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle =
        TextStyle(fontSize: 19.0, fontFamily: 'Gotham', color: Colors.black);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Gotham',
          color: Colors.black),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      backgroundColor: Hexcolor('#FFE8F7'),
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title: "PirateC",
              body: "Moreover like PirateSea",
              image: _buildImage('ship'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Find a treasure, in your map",
              body: "Most treasure hunters, get points",
              image: _buildImage('code'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Time to play!",
              bodyWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("It's always PirateC", style: bodyStyle),
                ],
              ),
              image: _buildImage('leggo'),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          skip: const Text('Skip',
              style: TextStyle(fontFamily: 'Gotham', color: Colors.black)),
          next: const Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
          done: const Text('Done',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gotham',
                  color: Colors.black)),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildImage(String assetName) {
  return Align(
      child: Image.asset('images/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter);
}
