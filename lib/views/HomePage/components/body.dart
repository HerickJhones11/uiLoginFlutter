import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


class User {
  int? id;
  String? name;
  String? email;

  User(int id, String name, String email) {
    this.id = id;
    this.name = name;
    this.email = email;
  }

  User.fromJson(Map json)
      : id = json['id'],
        name = json['first_name'],
        email = json['email'];

  Map toJson() {
    return {'id': id, 'name': name, 'email': email};
  }
}


const baseUrl = "http://10.0.2.2:8000/api";//"https://jsonplaceholder.typicode.com";

class API {




  static Future getUsers() async {
    var url = baseUrl + "/users";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('username');
    //print(userId);

    return http.get(Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization" : "Bearer $userId",
      },
    );

  }
}





