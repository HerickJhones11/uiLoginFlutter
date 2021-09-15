import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loginpage/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final  TextEditingController controller;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return TextFieldContainer(
      child: TextField(
        style: TextStyle(color: Colors.white),
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon,color: Colors.white,),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
          border: InputBorder.none,
        ),
        cursorColor: Colors.white,
      ),
    );
  }
}