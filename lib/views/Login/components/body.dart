import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loginpage/components/already_have_an_account_check.dart';
import 'package:loginpage/components/rounded_button.dart';
import 'package:loginpage/components/rounded_input_field.dart';
import 'package:loginpage/components/rounded_password_field.dart';
import 'package:loginpage/components/text_field_container.dart';
import 'package:loginpage/constants.dart';
import 'package:loginpage/views/Login/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
          ),
          SizedBox(height: size.height * 0.03,),
          SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.35,
          ),
          SizedBox(height: size.height * 0.03,),
          RoundedInputField(
            hintText: "Seu Email",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {
            },
          ),
          RoundedButton(text: 'LOGIN', press: (){}),
          SizedBox(height: size.height * 0.03,),
          AlreadyHaveAnAccountCheck(press: () {  },)


        ],
      ),
    );
  }
}




