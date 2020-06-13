import 'package:flutter/material.dart';
import 'package:deliveryboy/components/request_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Ongoing_Request extends StatefulWidget {
  @override
  _Ongoing_RequestState createState() => _Ongoing_RequestState();
}

class _Ongoing_RequestState extends State<Ongoing_Request> {
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
              status: 'Ongoing',
              statusBar: FontAwesomeIcons.batteryHalf,
              statusBarColor: Colors.yellow),
          RequestCard(
              status: 'Ongoing',
              statusBar: FontAwesomeIcons.batteryHalf,
              statusBarColor: Colors.yellow),
          RequestCard(
              status: 'Ongoing',
              statusBar: FontAwesomeIcons.batteryHalf,
              statusBarColor: Colors.yellow),
          RequestCard(
              status: 'Ongoing',
              statusBar: FontAwesomeIcons.batteryHalf,
              statusBarColor: Colors.yellow),
          RequestCard(
              status: 'Ongoing',
              statusBar: FontAwesomeIcons.batteryHalf,
              statusBarColor: Colors.yellow),
          RequestCard(
              status: 'Ongoing',
              statusBar: FontAwesomeIcons.batteryHalf,
              statusBarColor: Colors.yellow),
          RequestCard(
              status: 'Ongoing',
              statusBar: FontAwesomeIcons.batteryHalf,
              statusBarColor: Colors.yellow),
          RequestCard(
              status: 'Ongoing',
              statusBar: FontAwesomeIcons.batteryHalf,
              statusBarColor: Colors.yellow),
          RequestCard(
              status: 'Ongoing',
              statusBar: FontAwesomeIcons.batteryHalf,
              statusBarColor: Colors.yellow),
        ],
      ),
    );
  }
}
