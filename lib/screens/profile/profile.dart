import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/models/post.dart';
import 'package:trial/models/user.dart';
import 'package:trial/screens/home/home.dart';
import 'package:trial/screens/profile/createpost.dart';
import 'package:trial/screens/profile/profileedit.dart';
import 'package:trial/screens/profile/profiletile.dart';
import 'package:trial/services/auth.dart';
import 'package:trial/services/database.dart';
import 'package:trial/services/postdatabase.dart';

class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _editProfile() {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: EditProfile(),
            );
          });
    }

    var deviceSize = MediaQuery.of(context).size;
    return StreamProvider<List<UserData>>(
      create: (_) => DatabaseService().users,
      initialData: [],
      child: new Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Text('Pics4All'),
          backgroundColor: Colors.blueGrey[200],
          centerTitle: true,
          elevation: 1.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: _editProfile,
                icon: Icon(Icons.settings),
                label: Text('Edit Profile'))
          ],
        ),
        body: Container(
          height: deviceSize.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ProfileTile(),
                      new SizedBox(
                        width: 40.0,
                      ),
                      new Text(
                        '  Recent Posts',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.0),
                      ),
                      new SizedBox(
                        height: 420.0,
                      ),
                      StreamProvider<List<Postdata>>(
                        create: (_) => PostDatabaseService().posts,
                        initialData: [],
                        child: new IconButton(
                          icon: Icon(Icons.local_see_sharp),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreatePost()),
                            );
                          },
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ),
        /*new SizedBox(
            width: 40.0,
          ),
          new Text(
            '  Recent Posts',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),*/

        /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: List.generate(9, (index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                        child: FlatButton(
                          child: Container(
                              width: 200.0,
                              height: 200.0,
                              decoration: new BoxDecoration(
                                  border: new Border.all(
                                      width: 2.0, style: BorderStyle.none),
                                  borderRadius: new BorderRadius.vertical(
                                    top: new Radius.circular(10.0),
                                    bottom: new Radius.circular(10.0),
                                  ),
                                  shape: BoxShape.rectangle,
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: new NetworkImage(
                                        Utils.listOfImageUrl.elementAt(index),
                                      )))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Post()),
                            );
                          },
                        ),
                      );
                    })),
              ),
            ])),*/
        bottomNavigationBar: new Container(
          color: Colors.blueGrey[200],
          height: 50.0,
          child: new BottomAppBar(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),
                new IconButton(
                  icon: Icon(Icons.person, color: Colors.pink),
                  onPressed: () {},
                ),
                new IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
