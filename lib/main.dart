import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/screens/home/home.dart';
import 'package:trial/screens/wrapper.dart';
import 'package:trial/services/auth.dart';
import 'package:trial/models/user.dart';
import 'package:trial/services/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/*class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<User1?>>(
      create: (_) => ,
      //value: AuthService().user,
      initialData: [],
      child: MaterialApp(
        title: 'Pics4ALL',
        home: Wrapper(),
      ),
    );
  }
}*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: new Column(
        children: <Widget>[Flexible(child: Home())],
      )),
    );
  }
}

/*class MyHomePage extends StatelessWidget {
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
