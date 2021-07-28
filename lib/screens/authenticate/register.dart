import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:trial/services/auth.dart';
import 'package:trial/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';
  String cpassword = '';
  String error = '';
  bool loading = false;

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        elevation: 0.0,
        title: Text('Sign up!'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              TextFormField(
                  decoration: text.copyWith(hintText: 'Name'),
                  onChanged: (val) {
                    setState(
                      () => email = val,
                    );
                  }),
              SizedBox(height: 10.0),
              TextFormField(
                  decoration: text.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 10.0),
              TextFormField(
                  decoration: text.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: passwordValidator,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(height: 10.0),
              TextFormField(
                  decoration: text.copyWith(hintText: 'Confirm Password'),
                  obscureText: true,
                  validator: (val) =>
                      MatchValidator(errorText: 'Passwords do not match')
                          .validateMatch(val, password),
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 10.0),
              ElevatedButton(
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = 'Please give a valid email';
                        });
                      }
                      //   else {
                      //     setState(() => error = 'Successfully Registered.');
                      //   }
                      // }
                    }
                  }),
              SizedBox(height: 6.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              SizedBox(height: 10.0),
              ElevatedButton.icon(
                icon: Icon(Icons.person),
                label: Text('Sign In'),
                onPressed: () => widget.toggleView(),
                // {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => SignIn()),
                //   );
                // },
              )
            ],
          ),
        ),
      ),
    );
  }
}
