import 'package:deliveryboy/data/onboardingData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Delivery Boy",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<OnboardingModel> screen = new List<OnboardingModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screen = getOnboardingScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            itemCount: screen.length,
            itemBuilder: (context, index) {
              return OnboardingScreen(
                onboardingImage: screen[index].getScreenImage(),
                onboardingText: screen[index].getScreenText(),
              );
            }));
  }
}

class OnboardingScreen extends StatelessWidget {
  final String onboardingImage, onboardingText;
  OnboardingScreen({this.onboardingImage, this.onboardingText});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(onboardingImage),
          SizedBox(height: 20),
          Text(onboardingText)
        ],
      ),
    );
  }
}
