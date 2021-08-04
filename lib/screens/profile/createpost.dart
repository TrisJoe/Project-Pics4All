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
  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController uidController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
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
                controller: titleController,
                decoration: text.copyWith(hintText: 'Title of Post'),
                validator: (val) =>
                    val!.isEmpty ? 'Please enter a Title' : null,
                // onChanged: (val) => setState(() => _currenttitle = val),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: nameController,
                decoration: text.copyWith(hintText: 'Name'),
                validator: (val) => val!.isEmpty ? 'Please enter a Name' : null,
                //onChanged: (val) => setState(() => _currentname = val),
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
                  if (_formkey1.currentState!.validate()) {
                    await PostDatabaseService().updatePostdata(
                        imageController.text,
                        titleController.text,
                        nameController.text,
                        0,
                        uidController.text);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ));
  }
}
