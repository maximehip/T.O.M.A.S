import 'package:flutter/material.dart';
import 'package:tomas/Contact.dart';
import 'package:tomas/Menu.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {

  Widget build(BuildContext context) {
      return MaterialApp(
        title: "Tomas",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Tomas"),
          ),
          body: Column(
            children: <Widget>[
            new Text(
                "Que voulez-vous faire ?",
              style: TextStyle(fontSize: 50),
            ),
              new RaisedButton(onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new MenuView()),
                );
              }, child: Text("Appeler un contact", style: TextStyle(fontSize: 50),))
          ],)
        ),
      );
    }
}