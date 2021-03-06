import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loginpage/components/already_have_an_account_check.dart';
import 'package:loginpage/components/rounded_button.dart';
import 'package:loginpage/components/rounded_input_field.dart';
import 'package:loginpage/components/rounded_password_field.dart';
import 'package:loginpage/components/text_field_container.dart';
import 'package:loginpage/constants.dart';
import 'package:loginpage/views/HomePage/Home.dart';
import 'package:loginpage/views/Login/components/background.dart';
import 'package:http/http.dart' as http;
import 'package:loginpage/views/Login/components/controller.dart';
import 'package:loginpage/views/Notification/Notification.dart';
import 'package:loginpage/views/Signup/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var client = http.Client();

    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();



    checkUser(context);

    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /*Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
          ),*/
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            "assets/icons/edificio.svg",
            height: size.height * 0.45,
          ),
          //Image.asset("assets/images/logo_fort_condominios_02.png", width: size.width *  0.35,),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedInputField(
            hintText: "Seu Email",
            controller: userController,
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            controller: passwordController,
            onChanged: (value) {},
          ),
          RoundedButton(
              text: 'LOGIN',
              press: () {
                Login(userController, passwordController, context);
              }),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyHaveAnAccountCheck(
            press: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SignUpScreen();
                }),
              );
            },
          ),
          GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Home();
                }),
              );
            },
            child: Text(
                "Home PAge",
                style: TextStyle(
                    color: kPrimaryLightColor,
                    fontWeight: FontWeight.bold
                )
            ),
          ),
          GestureDetector(
            onTap: () async {
              SharedPreferences preferences = await SharedPreferences.getInstance();
              await preferences.clear();
            },
            child: Text(
                "Clear cache",
                style: TextStyle(
                    color: kPrimaryLightColor,
                    fontWeight: FontWeight.bold
                )
            ),
          ),
          GestureDetector(
            onTap: () async {
              print('levar pra tela de notification');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return NotificationPage();
                }),
              );

            },
            child: Text(
                "Notification",
                style: TextStyle(
                    color: kPrimaryLightColor,
                    fontWeight: FontWeight.bold
                )
            ),
          ),
        ],
      ),
    );
  }
}
