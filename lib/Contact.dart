import 'package:flutter/material.dart';
import 'package:tomas/Call.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:showcaseview/showcaseview.dart';

class Contact extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tomas",
      home: Scaffold(
          body: ShowCaseWidget(builder:
            Builder(
              builder: (context) => ContactPage(),
            ),)
      ),
    );

  }
}

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  GlobalKey _one = GlobalKey();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context).startShowCase(
            [_one]));
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tomas",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Tomas"),
          ),
          body: new Center(
            child: new Column(
              children: <Widget>[
                Image.asset('assets/images/Contact1.png'),
                new Text("Marie Dupont", style: TextStyle(fontSize: 30),),
                new Showcase(key: _one,
                    child: RaisedButton(onPressed: () async {
                      await _handleCameraAndMic();
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Call(
                                channel: "marie",
                              ),
                        ),
                      );
                    }, child: Text("Appel vidéo"),),
                    description: "Appuyez ici pour appeler Marie")
              ],
            ),
          )
      ),
    );
  }
  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}