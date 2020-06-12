import 'package:flutter/material.dart';
import 'package:deliveryboy/components/nav_drawer.dart';
import 'package:deliveryboy/components/rounded_button.dart';
import 'package:deliveryboy/components/request_textfield.dart';

class ContactScreen extends StatefulWidget {
  static String id = 'contact_screen';

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
                  'Contact us',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                RequestTextField(
                  label: 'Subject ',
                ),
                RequestTextField(
                  label: 'Message:',
                  length: 8,
                  hint: 'Type your message here...',
                ),
                RoundedButton(
                  color: Colors.yellow,
                  title: 'Submit',
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
