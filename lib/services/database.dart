import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trial/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference profilecollection =
      Firestore.instance.collection('usersdata');
  Future updateUserdata(String name, String email, int noposts, int nolikes,
      String password) async {
    return await profilecollection.document(uid).setData({
      'Name': name,
      'Email': email,
      'Password': password,
      'Number of posts': noposts,
      'Number of likes': nolikes,
    });
  }

  List<UserData> _userListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return UserData(
          name: doc.data['Name'] ?? '',
          email: doc.data['Email'] ?? '',
          nooflikes: doc.data['Number of likes'] ?? 0,
          noofposts: doc.data['Number of posts'] ?? 0);
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['Name'],
      email: snapshot.data['Email'],
      password: snapshot.data['Password'],
      nooflikes: snapshot.data['Number of likes'],
      noofposts: snapshot.data['Number of posts'],
    );
  }

  Stream<List<UserData>> get users {
    return profilecollection.snapshots().map(_userListfromSnapshot);
  }

  Stream<UserData> get userData {
    return profilecollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
