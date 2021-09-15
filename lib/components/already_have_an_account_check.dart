import 'package:flutter/material.dart';
import 'package:loginpage/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
            login ? "Não tem uma conta?" : "Já tem uma conta cadastrada ? ",
            style: TextStyle(color: kPrimaryLightColor)
        ),
        GestureDetector(
          onTap: press,
          child: Text(
              login ? "Registre-se" : "Login",
              style: TextStyle(
                  color: kPrimaryLightColor,
                  fontWeight: FontWeight.bold
              )
          ),
        )

      ],
    );
  }
}