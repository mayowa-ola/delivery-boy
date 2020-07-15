import 'package:flutter/material.dart';
import 'package:deliveryboy/components/nav_drawer.dart';
import 'package:deliveryboy/components/rounded_button.dart';
import 'package:deliveryboy/components/request_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppScreen extends StatefulWidget {
  static String id = 'app_screen';

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  String from;
  String to;
  String items;
  int weight;
  String imagePath;
  String comment;

  void deliveryRequest() {
    Firestore.instance.collection('items').document()
        .setData({ 'from': from, 'to': to, 'items': items, 'weight': weight, 'imagePath': imagePath, 'comment': comment,    });
  }
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
                  onChange: (value) {
                    from = value;
                  },
                ),
                RequestTextField(
                  label: 'To: ',
                  icon: Icons.location_on,
                  onChange: (value) {
                    to = value;
                  },
                ),
                RequestTextField(
                  label: 'Item(s): ',
                  icon: Icons.content_paste,
                  onChange: (value) {
                    items = value;
                  },
                ),
                RequestTextField(
                  label: 'Estimate weight (kg):',
                  icon: Icons.line_weight,
                  onChange: (value) {
                    weight = value;
                  },
                ),
                RequestTextField(
                  label: 'Item image (optional):',
                  icon: Icons.file_upload,
                  onChange: (value) {
                    imagePath = value;
                  },
                ),
                RequestTextField(
                  label: 'Comment (optional):',
                  length: 8,
                  hint: 'Type your comments here...',
                  onChange: (value) {
                    comment = value;
                  },
                ),
                RoundedButton(
                  color: Colors.yellow,
                  title: 'Request',
                  onPressed: () {
                    try {
                      deliveryRequest();
                    } catch (ex) {
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
