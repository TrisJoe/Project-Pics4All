import 'package:flutter/material.dart';
import 'package:trial/screens/authenticate/sign_in.dart';
import 'package:trial/screens/home/homelist.dart';
import 'package:trial/screens/profile/profile.dart';
import 'package:trial/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('Pics4All'),
        backgroundColor: Colors.blueGrey[200],
        centerTitle: true,
        elevation: 1.0,
        /*actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],*/
      ),
      /*body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            ),
        ),*/
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[Flexible(child: HomeList())],
      ),
      bottomNavigationBar: new Container(
        color: Colors.blueGrey[200],
        height: 50.0,
        child: new BottomAppBar(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(
                icon: Icon(Icons.home),
                onPressed: () {},
              ),
              new IconButton(
                icon: Icon(Icons.person, color: Colors.pink),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
              new IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
