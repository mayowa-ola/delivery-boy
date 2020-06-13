import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:deliveryboy/utils/constants.dart';

class RequestCard extends StatelessWidget {
  final String status;
  final statusBar;
  final Color statusBarColor;
  RequestCard({this.status, this.statusBar, this.statusBarColor});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Column(
          children: <Widget>[
            Image.asset('images/item.jpg'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'HP LAPTOP',
                        style: kTextFiledStyle.copyWith(
                            color: Colors.yellow, fontSize: 15),
                      ),
                      Text('30Kg',
                          style: kTextFiledStyle.copyWith(fontSize: 15))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod uat.',
                    style: kTextFiledStyle.copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Location: ',
                        style: kTextFiledStyle.copyWith(
                            color: Colors.yellow, fontSize: 16),
                      ),
                    ],
                  ),
                  Text(
                    '23, Delivery boy street, Ibadan. Oyo State',
                    style: kTextFiledStyle.copyWith(fontSize: 11),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Status',
                        style: kTextFiledStyle.copyWith(
                            color: Colors.yellow, fontSize: 12),
                      ),
                      Text(
                        status,
                        style: kTextFiledStyle.copyWith(fontSize: 12),
                      ),
                      FaIcon(statusBar, color: statusBarColor, size: 12),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
