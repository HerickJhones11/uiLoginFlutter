import 'package:flutter/material.dart';
import 'package:loginpage/components/rounded_button.dart';
import 'package:loginpage/constants.dart';
import 'background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // this size provides us total height and width of our screen
    // This size provide us total height and width of our screen
    return Background(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
                "WELCOME TO EDU",
                style: TextStyle(fontWeight: FontWeight.bold)
            ),
            SizedBox(height: size.height * 0.03,),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05,),
            RoundedButton(
              text:'Login',
              press:() {}

              ),
            RoundedButton(
                text:'Login',
                color: kPrimaryLightColor,
                textColor: Colors.black,
                press:() {}
            ),
          ],
      ),
        )
    );
  }



  TextButton ClipRRect() {

    return TextButton(

          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
            primary: Colors.white,
            backgroundColor: kPrimaryColor
          ),
          onPressed: () {},
          child: const Text('LOGIN',),
        );
  }
}



