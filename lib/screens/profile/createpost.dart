import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/models/post.dart';
import 'package:trial/services/postdatabase.dart';
import 'package:trial/shared/constants.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _formkey1 = GlobalKey<FormState>();
  String _currenttitle;
  String _currentname;
  String _currentimageURL;
  String _currentnooflikespost;
  String _currentuid;
  @override
  Widget build(BuildContext context) {
    final post = Provider.of<Post>(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: StreamBuilder<Postdata>(
        stream: PostDatabaseService(key: post.key).postData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Postdata postData = snapshot.data;
            return Form(
              key: _formkey1,
              child: Column(
                children: <Widget>[
                  Text(
                    'Create a New Post',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: postData.title,
                    decoration: text.copyWith(hintText: 'Title of Post'),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a Title' : null,
                    onChanged: (val) => setState(() => _currenttitle = val),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: postData.name,
                    decoration: text.copyWith(hintText: 'Name'),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a Name' : null,
                    onChanged: (val) => setState(() => _currentname = val),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formkey1.currentState.validate()) {
                        await PostDatabaseService(key: post.key).updatePostdata(
                            _currentimageURL ?? postData.imageURL,
                            _currenttitle ?? postData.title,
                            _currentname ?? postData.name,
                            _currentnooflikespost ?? postData.nooflikespost,
                            _currentuid ?? postData.uid);
                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
