import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/screens/wrapper.dart';
import 'package:trial/services/auth.dart';

import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        title: 'Pics4ALL',
        home: Wrapper(),
      ),
    );
  }
}
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                0.3,
                0.6,
                1
              ],
                  colors: [
                Colors.purpleAccent,
                Colors.white,
                Colors.lightBlue
              ])),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
                child: Text('Pics4All',
                    style: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.purpleAccent)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp1()),
                  );
                }),
          )),
    );
  }
}*/
