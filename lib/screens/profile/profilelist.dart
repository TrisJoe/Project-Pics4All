import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/models/user.dart';
import 'package:trial/screens/profile/profiletile.dart';
import 'package:trial/services/database.dart';

class ProfileList extends StatelessWidget {
  final UserData? userdata;
  ProfileList({this.userdata});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User1>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        return ProfileTile();
      },
    );
  }
}
