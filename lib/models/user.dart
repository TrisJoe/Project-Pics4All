import 'package:flutter/cupertino.dart';

class User1 with ChangeNotifier {
  String uid = "";
  String get user => uid;
}

class UserData {
  final String? uid;
  final String? name;
  final String? email;
  final String? password;
  final int? noofposts;
  final int? nooflikes;
  UserData(
      {this.uid,
      this.name,
      this.email,
      this.password,
      this.nooflikes,
      this.noofposts});
}
