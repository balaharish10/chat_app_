import 'package:flutter/material.dart';
import'package:flash_chat/components/roundedbutton.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class LoginScreen extends StatefulWidget {
 static String id='login screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  bool spinner=false;
  String password;
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
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
                  email=value;
                },
                decoration:Kdecor.copyWith(hintText: "Enter email ID")
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password=value;
                },
                decoration: Kdecor.copyWith(hintText: "Enter your password")
              ),
              SizedBox(
                height: 24.0,
              ),
              roundedbutton(name: "LOGIN",onpress: () async {
                setState(() {
                  spinner=true;
                });
                final user=await _auth.signInWithEmailAndPassword(email: email, password: password);
if(user!=null)
  {
    Navigator.pushNamed(context,ChatScreen.id );
    setState(() {
      spinner=false;
    });
  }
              },)
            ],
          ),
        ),
      ),
    );
  }
}
