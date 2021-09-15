import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loginpage/components/already_have_an_account_check.dart';
import 'package:loginpage/components/rounded_button.dart';
import 'package:loginpage/components/rounded_input_field.dart';
import 'package:loginpage/components/rounded_password_field.dart';
import 'package:loginpage/views/Login/login_screen.dart';
import 'package:loginpage/views/Signup/components/background.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /*Text(
            "Registre-se",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),*/
          SizedBox(height: size.height * 0.03,),
          SvgPicture.asset(
            "assets/icons/town.svg",
            height: size.height * 0.35,
          ),
          RoundedInputField(
            hintText: "Seu email",
            onChanged: (value) {},
            controller: userController,
          ),
          RoundedPasswordField(
              controller: passwordController, onChanged: (value) {}),
          RoundedButton(text: "Registre-se", press: () {}),
          SizedBox(height: size.height * 0.03,),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
