import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:deliveryboy/components/request_card.dart';

class Past_Request extends StatefulWidget {
  @override
  _Past_RequestState createState() => _Past_RequestState();
}

class _Past_RequestState extends State<Past_Request> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisSpacing: 15,
        childAspectRatio: 0.6,
        padding: EdgeInsets.all(15),
        crossAxisCount: 2,
        children: <Widget>[
          RequestCard(
              status: 'Delivered',
              statusBar: FontAwesomeIcons.batteryFull,
              statusBarColor: Colors.green),
          RequestCard(
              status: 'Delivered',
              statusBar: FontAwesomeIcons.batteryFull,
              statusBarColor: Colors.green),
          RequestCard(
              status: 'Delivered',
              statusBar: FontAwesomeIcons.batteryFull,
              statusBarColor: Colors.green),
          RequestCard(
              status: 'Delivered',
              statusBar: FontAwesomeIcons.batteryFull,
              statusBarColor: Colors.green),
          RequestCard(
              status: 'Delivered',
              statusBar: FontAwesomeIcons.batteryFull,
              statusBarColor: Colors.green),
          RequestCard(
              status: 'Delivered',
              statusBar: FontAwesomeIcons.batteryFull,
              statusBarColor: Colors.green),
          RequestCard(
              status: 'Delivered',
              statusBar: FontAwesomeIcons.batteryFull,
              statusBarColor: Colors.green),
        ],
      ),
    );
  }
}
