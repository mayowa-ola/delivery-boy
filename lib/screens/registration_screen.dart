import 'package:flutter/material.dart';
import 'package:deliveryboy/components/rounded_button.dart';
import 'package:deliveryboy/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:deliveryboy/screens/app_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  bool error = false;
  String password;
  String email;
  String name;
  String userId;
  String contact;
  String address;
  String confirmPassword;
  String errorMessage;
  void storeUserDetails() async{
    final FirebaseUser user = await _auth.currentUser();
    Firestore.instance.collection('users').document(user.uid)
        .setData({ 'name': name, 'email': email, 'contact': contact, 'address': address,  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.jpg'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              error ? Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(errorMessage, style: kTextFiledStyle,textAlign: TextAlign.center,),
                decoration: BoxDecoration( color: Colors.redAccent,),
              ) : Container(),
              TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Full Name')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    contact = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Phone Number')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    address = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your contact address')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Email')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Password')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    confirmPassword = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Confirm your Password')),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                color: Colors.yellow,
                title: 'Register',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    if(password != confirmPassword) {
                      setState(() {
                        error = true;
                        errorMessage = 'Your password do not match';
                        showSpinner = false;
                      });
                      return;
                    }

                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
//                    setState(() {
//                      userId = _auth.ge;
//                    });
                      storeUserDetails();
                      Navigator.pushNamed(context, AppScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (ex) {
                    setState(() {
                      if(ex.message == null) {
                        errorMessage = 'Please enter email and password';
                      }
                      else errorMessage = ex.message;
                      error = true;
                      showSpinner = false;
                    });
                    print(ex);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
