import 'package:flutter/material.dart';
import 'package:tomas/Contact.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tomas/Livres.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Tomas",
      home: Scaffold(
          body: ShowCaseWidget(builder:
          Builder(
            builder: (context) => MenuPage(),
          ),)
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<MenuPage> {
  GlobalKey _one = GlobalKey();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context).startShowCase(
            [_one]));
  }

  Widget build(BuildContext context) {
    List apps = ["Appels", "Photos", "Messages", "Agenda","Mails", "Livres"];
    final appsmap = apps.asMap();
    return MaterialApp(
      title: "Tomas",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tomas"),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(6, (index) {
            if (index == 0) {
              return Center(
                  child: Showcase(key: _one,
                  child: RaisedButton(onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => new Contact()),
                    );
                  }, child: Text(appsmap[index], style: TextStyle(fontSize: 45),)),
                  description: "Appuyez ici pour faire un appel",)
              );
            } else if (index == 5){
              return Center(
                  child: RaisedButton(onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => new Livres()),
                    );
                  }, child: Text(appsmap[index], style: TextStyle(fontSize: 45),))
              );
            } else {
              return Center(
                  child: RaisedButton(onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => new Contact()),
                    );
                  }, child: Text(appsmap[index], style: TextStyle(fontSize: 45),))
              );
            }
          }),
        ),
      ),
    );
  }
}