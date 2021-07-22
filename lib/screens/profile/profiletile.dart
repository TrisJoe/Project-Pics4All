import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/models/user.dart';
import 'package:trial/services/database.dart';

class ProfileTile extends StatelessWidget {
  final UserData userdata;
  ProfileTile({this.userdata});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
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
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            userData.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30.0,
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0)),
                          Text(
                            userData.email,
                            style: const TextStyle(fontSize: 15.0),
                          ),
                          new ElevatedButton(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.favorite_border_outlined,
                                    color: Colors.pink),
                                Text(
                                  '${userData.nooflikes} likes',
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            onPressed: null,
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.0)),
                          new ElevatedButton(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.photo_rounded, color: Colors.pink),
                                Text(
                                  '${userData.noofposts} posts',
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            onPressed: null,
                          ),
                        ],
                      ))
                ],
              ),
            );
          } else {}
        });
  }
}
/*child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <
                Widget>[
              Expanded(
                flex: 2,
                child: Container(
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
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      user12.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                    Text(
                      user12.email,
                      style: const TextStyle(fontSize: 10.0),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                    new IconButton(
                      icon: Icon(Icons.favorite_border_outlined,
                          color: Colors.pink),
                      onPressed: null,
                    ),
                    Text(
                      '${user12.nolikes} likes',
                      style: const TextStyle(fontSize: 10.0),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                    new IconButton(
                      icon: Icon(Icons.photo_rounded, color: Colors.pink),
                      onPressed: null,
                    ),
                    Text(
                      '${user12.noposts} posts',
                      style: const TextStyle(fontSize: 10.0),
                    ),
                  ],
                ),
              ),
            ]),
          ),;
  }),
*/