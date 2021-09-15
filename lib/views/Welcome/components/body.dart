import 'package:flutter/material.dart';
import 'package:loginpage/components/rounded_button.dart';
import 'package:loginpage/constants.dart';
import 'package:loginpage/views/Login/login_screen.dart';
import 'package:loginpage/views/Signup/signup_screen.dart';
import 'background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // this size provides us total height and width of our screen
    // This size provide us total height and width of our screen
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Fort Condomínio",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.blue)),
          SizedBox(
            height: size.height * 0.03,
          ),
          Column(
            children: <Widget>[
              Image.asset(
                'assets/images/after.png',
                width: 300,
              ),
            ],
          ),
          /*SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),*/
          SizedBox(
            height: size.height * 0.05,
          ),
          RoundedButton(
              text: 'Login',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              }),
          RoundedButton(
              text: 'Registrar-se',
              color: kPrimaryLightColor,
              textColor: Colors.white,
              press: () {
                print('teste');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              }),
        ],
      ),
    ));
  }

  TextButton ClipRRect() {
    return TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          primary: Colors.white,
          backgroundColor: kPrimaryColor),
      onPressed: () {},
      child: const Text(
        'LOGIN',
      ),
    );
  }
}
