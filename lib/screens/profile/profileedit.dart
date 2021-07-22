import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/models/user.dart';
import 'package:trial/services/database.dart';
import 'package:trial/shared/constants.dart';
import 'package:trial/shared/loading.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formkey = GlobalKey<FormState>();
  String _currentname;
  String _currentemail;
  String _currentpassword;
  int _currentlikes;
  int _currentposts;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update Profile',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: text.copyWith(hintText: 'Name:'),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a Name' : null,
                    onChanged: (val) => setState(() => _currentname = val),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userData.email,
                    decoration: text.copyWith(hintText: 'Email:'),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter the email' : null,
                    onChanged: (val) => setState(() => _currentemail = val),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userData.password,
                    obscureText: true,
                    decoration: text.copyWith(hintText: 'Password'),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter password' : null,
                    onChanged: (val) => setState(() => _currentpassword = val),
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
                      if (_formkey.currentState.validate()) {
                        await DatabaseService(uid: user.uid).updateUserdata(
                            _currentname ?? userData.name,
                            _currentemail ?? userData.email,
                            _currentposts ?? userData.noofposts,
                            _currentlikes ?? userData.nooflikes,
                            _currentpassword ?? userData.password);
                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
