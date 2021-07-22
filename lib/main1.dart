import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/screens/wrapper.dart';
import 'package:trial/services/auth.dart';
import 'models/user.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
