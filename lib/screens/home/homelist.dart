import 'package:flutter/material.dart';
import 'package:trial/screens/home/homestories.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: new Border.all(width: 2.0, style: BorderStyle.solid),
      borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return new ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => index == 0
            ? new SizedBox(
                child: new HomeStories(),
                height: deviceSize.height * 0.20,
              )
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Container(
                  decoration: myBoxDecoration(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: new Border.all(
                                width: 2.0, style: BorderStyle.solid),
                            borderRadius: new BorderRadius.vertical(
                              top: new Radius.circular(20.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 20.0),
                            child: new Image.network(
                              "https://bookbub-res.cloudinary.com/image/upload/f_auto,q_auto/v1584109251/blog/21-awesome-bookshelf-ideas-attic-wall.jpg",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  new Column(children: <Widget>[
                                    new Text(
                                      'Bookshelf',
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
                                  new IconButton(
                                    icon: Icon(Icons.logout),
                                    onPressed: null,
                                  )
                                ],
                              ),
                              new Row(children: [
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
                              ])
                            ],
                          ),
                        )
                      ]),
                ),
              ));
  }
}
