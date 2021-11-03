import 'package:fire_chat/components/round_button.dart';
import 'package:fire_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  
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
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                textAlign: TextAlign.center,
                decoration: kTextFileDecoration.copyWith(
                  hintText: 'Enter your Email.',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                textAlign: TextAlign.center,
                decoration: kTextFileDecoration.copyWith(
                  hintText: 'Enter your PassWord',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Rounded_Button(
                text: 'Login',
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner= true;
                  });
                  try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showSpinner= false;
                      });
                    } catch (e) {
                      print(e);
                    }
                }, 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
