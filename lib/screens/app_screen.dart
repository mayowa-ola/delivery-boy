import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:deliveryboy/components/nav_drawer.dart';
import 'package:deliveryboy/components/rounded_button.dart';
import 'package:deliveryboy/components/request_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AppScreen extends StatefulWidget {
  static String id = 'app_screen';

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
//  variable declaration
  String from;
  String to;
  String items;
  String weight;
  String imagePath;
  String comment;
  File _image;
  bool _isImage = false;

  //storing data into firebase
  void deliveryRequest() {
    Firestore.instance.collection('items').document()
        .setData({ 'from': from, 'to': to, 'items': items, 'weight': weight, 'imagePath': imagePath, 'comment': comment,    });
  }

  //handle picking image from the device
  final picker = ImagePicker();
  Future getImage() async {
    print('upload button pressed');
   final pickedFile = await picker.getImage(source: ImageSource.camera);
//    final pickedFile = await picker.getImage(source: ImageSource.gallery); for picking image from gallery
    final timeStamp = new DateTime.now().millisecondsSinceEpoch;

    setState(() {
      _image = File(pickedFile.path);
      _isImage = true;
    });
    StorageReference storageReference = FirebaseStorage().ref().child('delivery_items').child(timeStamp.toString());
    StorageUploadTask storageUploadTask = storageReference.putFile(_image);

    if (storageUploadTask.isSuccessful || storageUploadTask.isComplete) {
      imagePath = await storageReference.getDownloadURL();

    } else if (storageUploadTask.isInProgress) {

      storageUploadTask.events.listen((event) {
        double percentage = 100 *(event.snapshot.bytesTransferred.toDouble()
            / event.snapshot.totalByteCount.toDouble());
      });

      StorageTaskSnapshot storageTaskSnapshot =await storageUploadTask.onComplete;
      imagePath  = await storageTaskSnapshot.ref.getDownloadURL();
    }
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
                    setState(() {
                      from = value;
                    });
                  },
                ),
                RequestTextField(
                  label: 'To: ',
                  icon: Icons.location_on,
                  onChange: (value) {
                    setState(() {
                      to = value;
                    });
                  },
                ),
                RequestTextField(
                  label: 'Item(s): ',
                  icon: Icons.content_paste,
                  onChange: (value) {
                    setState(() {
                      items = value;
                    });
                  },
                ),
                RequestTextField(
                  label: 'Estimate weight (kg):',
                  icon: Icons.line_weight,
                  onChange: (value) {
                    setState(() {
                      weight = value;
                    });
                  },
                ),
                _isImage ?
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(child: Image.file(_image),height: 200,),
                ) : Container(),
                RaisedButton(
                  color: Colors.yellow,
                  onPressed: getImage,
                  child: Text('Upload Image', style: TextStyle(fontSize: 20)),
                ),
                RequestTextField(
                  label: 'Comment (optional):',
                  length: 8,
                  hint: 'Type your comments here...',
                  onChange: (value) {
                    setState(() {
                      comment = value;
                    });
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
