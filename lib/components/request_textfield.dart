import 'package:flutter/material.dart';
import 'package:deliveryboy/utils/constants.dart';

class RequestTextField extends StatelessWidget {
  final String label;
  final icon;
  final int length;
  final String hint;
  RequestTextField({this.label, this.icon, this.length: 1, this.hint: ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Text(label, textAlign: TextAlign.left, style: kTextFiledStyle),
          SizedBox(
            height: 15.0,
          ),
          TextField(
            maxLines: length,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black),
            onChanged: (value) {},
            decoration: kTextFieldDecoration.copyWith(
              hintText: hint,
              prefixIcon: Icon(
                icon,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
