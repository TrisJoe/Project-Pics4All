import 'package:firebase_auth/firebase_auth.dart';
import 'package:trial/models/user.dart';
import 'package:trial/screens/authenticate/sign_in.dart';
import 'package:trial/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create
  User _userfromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userfromFirebaseUser);
  }

  //signin anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userfromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateUserdata(
        'NewMember',
        'newmember123@gmail.com',
        0,
        0,
        'test123',
      );
      return _userfromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
