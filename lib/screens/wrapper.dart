import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/models/user.dart';
import 'package:trial/screens/authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User1>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
