import 'package:flutter/material.dart';
import 'package:deliveryboy/screens/app_screen.dart';
import 'package:deliveryboy/screens/request_screen.dart';
import 'package:deliveryboy/screens/contact_screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppScreen()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Delivery Request'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RequestScreen()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Contact us'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactScreen()),
              )
            },
          )
        ],
      ),
    );
  }
}
