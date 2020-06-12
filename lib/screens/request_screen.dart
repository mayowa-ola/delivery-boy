import 'package:flutter/material.dart';
import 'package:deliveryboy/components/nav_drawer.dart';

class RequestScreen extends StatefulWidget {
  static String id = 'request_screen';

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.yellow, scaffoldBackgroundColor: Colors.black),
      home: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
            title: const Text('Delivery Request',
                style: TextStyle(color: Colors.black54)),
            actions: <Widget>[
              // action 0.button
            ]),
      ),
    );
  }
}
