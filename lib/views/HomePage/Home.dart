import 'dart:convert';

import 'package:flutter/material.dart';
import 'components/body.dart';


class Home extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}
class _MyListScreenState extends State {
  List<User> users = List<User>.empty(growable: true);


  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        //print(response.body);
        Iterable list = json.decode(response.body)["data"];
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(users[index].name ?? 'descricao'));
          },
        ));
  }
}