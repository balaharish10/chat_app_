import 'package:flash_chat/components/roundedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'chat_screen.dart';
class RegistrationScreen extends StatefulWidget {
  static String id='registration screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool spinner=false;
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
                onChanged: (value) {
                  password=value;
                },
                  obscureText: true,
                decoration:Kdecor.copyWith(hintText: "Enter your password")
              ),
              SizedBox(
                height: 24.0,
              ),
              roundedbutton(name: "Register",onpress: () async{
              setState(() {
                spinner=true;
              });

                try {
                  final newuser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if(newuser!=null)
                    {
                      Navigator.pushNamed(context,ChatScreen.id);
                    }
                  setState(() {
                    spinner=false;
                  });
                }
                catch(e)
                {
                  print(e);
                }
              },),
            ],
          ),
        ),
      ),
    );
  }
}
