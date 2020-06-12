import 'package:flutter/material.dart';
import 'package:deliveryboy/components/nav_drawer.dart';
import 'package:deliveryboy/components/rounded_button.dart';
import 'package:deliveryboy/components/request_textfield.dart';

class AppScreen extends StatefulWidget {
  static String id = 'app_screen';

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.yellow, scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
            title: const Text('Home', style: TextStyle(color: Colors.black54)),
            actions: <Widget>[
              // action 0.button
            ]),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Get something delivered',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                RequestTextField(
                  label: 'From: ',
                  icon: Icons.location_on,
                ),
                RequestTextField(
                  label: 'To: ',
                  icon: Icons.location_on,
                ),
                RequestTextField(
                  label: 'Item(s): ',
                  icon: Icons.content_paste,
                ),
                RequestTextField(
                  label: 'Estimate weight (kg):',
                  icon: Icons.line_weight,
                ),
                RequestTextField(
                  label: 'Item image (optional):',
                  icon: Icons.file_upload,
                ),
                RequestTextField(
                  label: 'Comment (optional):',
                  length: 8,
                  hint: 'Type your comments here...',
                ),
                RoundedButton(
                  color: Colors.yellow,
                  title: 'Request',
                  onPressed: () {
                    try {} catch (ex) {
                      print(ex);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
