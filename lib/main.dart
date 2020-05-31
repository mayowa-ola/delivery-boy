import 'package:deliveryboy/data/onboardingData.dart';
import 'package:deliveryboy/screens/app_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:deliveryboy/screens/welcome_screen.dart';
import 'package:deliveryboy/screens/login_screen.dart';
import 'package:deliveryboy/screens/registration_screen.dart';
import 'package:deliveryboy/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.yellow,
//          fontFamily: 'Raleway',
          scaffoldBackgroundColor: Colors.white),
      title: "Delivery Boy",
      home: Home(),
//      debugShowCheckedModeBanner: false,
      initialRoute: Home.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        AppScreen.id: (context) => AppScreen(),
        Home.id: (context) => Home()
      },
    );
  }
}

class Home extends StatefulWidget {
  static String id = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<OnboardingModel> screen = new List<OnboardingModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screen = getOnboardingScreen();
  }

  Widget pageIndexIndicator(bool isCurrentpage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentpage ? 10.0 : 6.0,
      width: isCurrentpage ? 10.0 : 6.0,
      decoration: BoxDecoration(
          color: isCurrentpage ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            controller: pageController,
            itemCount: screen.length,
            onPageChanged: (val) {
              setState(() {
                currentIndex = val;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingScreen(
                onboardingImage: screen[index].getScreenImage(),
                onboardingText: screen[index].getScreenText(),
              );
            }),
        bottomSheet: currentIndex != screen.length - 1
            ? Container(
                height: Platform.isIOS ? 70 : 60,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        pageController.animateToPage(screen.length - 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      child: Text("SKIP"),
                    ),
                    Row(
                      children: <Widget>[
                        for (int i = 0; i < screen.length; i++)
                          currentIndex == i
                              ? pageIndexIndicator(true)
                              : pageIndexIndicator(false)
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        pageController.animateToPage(currentIndex + 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      child: Text("NEXT"),
                    ),
                  ],
                ),
              )
            : Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: Platform.isIOS ? 70 : 60,
                color: Colors.yellow,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, WelcomeScreen.id);
                  },
                  child: Text(
                    "GET STARTED NOW",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ));
  }
}

class OnboardingScreen extends StatelessWidget {
  final String onboardingImage;
  final String onboardingText;
  OnboardingScreen({this.onboardingImage, this.onboardingText});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(onboardingImage),
          SizedBox(height: 20),
          Text(
            onboardingText,
            style: TextStyle(
                fontSize: 45,
                color: Colors.black54,
                fontWeight: FontWeight.w700,
                fontFamily: 'Euphoria'),
          )
        ],
      ),
    );
  }
}
