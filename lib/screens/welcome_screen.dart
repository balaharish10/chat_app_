import 'package:flutter/material.dart';
import 'login_screen.dart';
import "registration_screen.dart";
import 'package:flash_chat/components/roundedbutton.dart';
class WelcomeScreen extends StatefulWidget {
 static String id='welcome screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 3),
      vsync:this,
    );
    controller.forward();
    controller.addListener(()
    {
      setState(() {
      });
    });

  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            roundedbutton(name: "Login",onpress: () {
    Navigator.pushNamed(context,LoginScreen.id);
    },),
            roundedbutton(name: "Sign up",onpress: () {
    Navigator.pushNamed(context,RegistrationScreen.id);
    },),
          ],
        ),
      ),
    );
  }
}

