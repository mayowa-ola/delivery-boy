import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  static String id = 'app_screen';

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Welcome to delivery boy'),
    );
  }
}
