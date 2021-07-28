import 'package:flutter/material.dart';
import 'package:trial/screens/profile/profile.dart';
import 'package:trial/services/auth.dart';
import '../home/home.dart';

class Post1 extends StatelessWidget {
  final AuthService _auth = AuthService();
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: new Border.all(width: 2.0, style: BorderStyle.solid),
      borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('Pics4All'),
        backgroundColor: Colors.blueGrey[200],
        centerTitle: true,
        elevation: 1.0,
      ),
      body: SingleChildScrollView(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
            new SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              "https://c8.alamy.com/comp/2B1FH8E/vertical-portrait-of-a-happy-little-girl-smiling-on-a-blue-background-happy-childhood-and-lifestyle-concept-copy-space-for-text-2B1FH8E.jpg"))),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
                new Column(children: <Widget>[
                  new Text(
                    'John Walker',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
                  ),
                  new Text(
                    'johnwalker@gmail.com',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                  Row(
                    children: [
                      new IconButton(
                        icon: Icon(Icons.favorite_border_outlined,
                            color: Colors.pink),
                        onPressed: null,
                      ),
                      new Text(
                        '250 likes',
                        style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 0),
                  Row(
                    children: [
                      new IconButton(
                        icon: Icon(Icons.photo_rounded, color: Colors.pink),
                        onPressed: null,
                      ),
                      new Text(
                        '50 posts',
                        style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ],
                  ),
                ])
              ],
            ),
            new SizedBox(
              width: 40.0,
            ),
            new Text(
              '  Recent Posts',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Container(
                decoration: myBoxDecoration(),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new IconButton(
                        icon: Icon(Icons.close, color: Colors.pink),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: new Border.all(
                              width: 2.0,
                              style: BorderStyle.solid,
                              color: Colors.white),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          child: new Image.network(
                            "https://bookbub-res.cloudinary.com/image/upload/f_auto,q_auto/v1584109251/blog/21-awesome-bookshelf-ideas-attic-wall.jpg",
                            height: 350.0,
                            width: 350.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        //padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                new Column(children: <Widget>[
                                  new Text(
                                    'Pictures',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  new Text(
                                    'By: John Walker',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                ]),
                              ],
                            ),
                            new Text(
                              '250',
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            new IconButton(
                              icon: Icon(Icons.favorite_border_outlined,
                                  color: Colors.pink),
                              onPressed: null,
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            )
          ])),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
              new IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
