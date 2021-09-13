import 'package:flutter/material.dart';
import '../../constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // this size provides us total height and width of our screen

    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.8,
        child: TextButton(
          child: Text(
              text.toUpperCase(),
              style: TextStyle(fontSize: 14)
          ),
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 20,horizontal: 40)),
              foregroundColor: MaterialStateProperty.all<Color>(textColor),
              backgroundColor: MaterialStateProperty.all<Color>(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    //side: BorderSide(color: Colors.red)
                  )
              )
          ),
          onPressed: () => press,
        )
    );
  }
}