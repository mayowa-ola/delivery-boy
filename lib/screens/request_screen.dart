import 'package:deliveryboy/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:deliveryboy/components/nav_drawer.dart';
import 'package:deliveryboy/screens/ongoing_request_screen.dart';
import 'package:deliveryboy/screens/past_request_screen.dart';



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
          primaryColor: Colors.yellow, scaffoldBackgroundColor: Colors.white),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Delivery Request',
                style: TextStyle(color: Colors.black54)),
            actions: <Widget>[
              // action 0.button
            ],
            bottom: TabBar(
              tabs: [
                Text('Ongoing Request', style: kTextFiledStyle),
                Text('Past Request', style: kTextFiledStyle),
              ],
            ),
          ),
          drawer: NavDrawer(),
          body: TabBarView(
            children: [
              Ongoing_Request(),
              Past_Request(),
            ],
          ),
        ),
      ),
    );
  }
}
