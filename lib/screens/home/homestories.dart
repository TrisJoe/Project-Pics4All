import 'package:flutter/material.dart';

class HomeStories extends StatelessWidget {
  final stories = Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: new ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => new Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  new Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://c8.alamy.com/comp/2B1FH8E/vertical-portrait-of-a-happy-little-girl-smiling-on-a-blue-background-happy-childhood-and-lifestyle-concept-copy-space-for-text-2B1FH8E.jpg"))),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ],
              )),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          stories,
          new SizedBox(
            width: 10.0,
          ),
          new Text(
            'New Posts',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
          )
        ],
      ),
    );
  }
}
