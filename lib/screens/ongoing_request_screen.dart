import 'package:deliveryboy/utils/constants.dart';
import 'package:flutter/material.dart';

class Ongoing_Request extends StatefulWidget {
  @override
  _Ongoing_RequestState createState() => _Ongoing_RequestState();
}

class _Ongoing_RequestState extends State<Ongoing_Request> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Ongoing Request',
        style: kTextFiledStyle,
      ),
    );
  }
}
