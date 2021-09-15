import 'package:flutter/material.dart';
import 'package:loginpage/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final  TextEditingController controller;

  const RoundedPasswordField({
    Key? key,
    required this.controller,
    required this.onChanged

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(child: TextField(
        obscureText: true,
        onChanged: onChanged,
        style: TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
            icon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: Colors.white,
            ),
            border: InputBorder.none
        )
    ),
    );
  }
}
