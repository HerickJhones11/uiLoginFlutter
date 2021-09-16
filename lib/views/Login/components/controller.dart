import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginpage/views/HomePage/Home.dart';
import 'package:loginpage/views/HomePage/components/body.dart';
import 'package:shared_preferences/shared_preferences.dart';


var client = http.Client();

Future<http.Response> Login ( TextEditingController user, TextEditingController user_password ,BuildContext context) async {
  var url = 'http://10.0.2.2:8000/api/login';
  var email = user.text;
  var password = user_password.text;

  email = 'sysadmin@gmail.com';
  password = '1234';


  Map data = {
    "email": email,
    "password": password,
  };


  //encode Map to JSON
  var body = json.encode(data);

  print('tese');

  var response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: body
  );
  print("${response.statusCode}");
  print('tese');

  print("${response.statusCode}");
  if(response.statusCode == 200){
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', json.decode(response.body)["token"]);
    //final String? userId = prefs.getString('token');


    //final LocalStorage storage = new LocalStorage(response.body.token);
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) => new Home())
    );
  }


  return response;
}

Future<http.Response> checkAuth ( TextEditingController user, TextEditingController user_password ,BuildContext context) async {




  var url ='http://10.0.2.2:8000/api/login';
  var email = user.text;
  var password = user_password.text;

  email = 'sysadmin@gmail.com';
  password = '1234';


  Map data = {
    "email": email,
    "password": password,
  };


  //encode Map to JSON
  var body = json.encode(data);


  var response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: body
  );

  print("${response.statusCode}");
  if(response.statusCode == 200){
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', json.decode(response.body)["token"]);
    //final String? userId = prefs.getString('token');


    //final LocalStorage storage = new LocalStorage(response.body.token);
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) => new Home())
    );
  }


  return response;
}

void checkUser(BuildContext context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  if (token != null) {
    final String? token = prefs.getString('token');
    const url = "http://10.0.2.2:8000/api/login/check";
    var response = await http.get(Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization" : "Bearer $token",
      },
    );
    bool valid = json.decode(response.body)["valid"];
    if(valid == true){
      Navigator.push(context, new MaterialPageRoute(
          builder: (context) => new Home())
      );
    }
  }
  //print(token);
}