import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trial/models/user.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  final CollectionReference profilecollection =
      FirebaseFirestore.instance.collection('usersdata');
  Future updateUserdata(String? name, String? email, int? noposts, int? nolikes,
      String? password) async {
    return await profilecollection.doc(uid).set({
      'Name': name,
      'Email': email,
      'Password': password,
      'Number of posts': noposts,
      'Number of likes': nolikes,
    });
  }

  List<UserData> _userListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserData(
          name: doc['Name'] ?? '',
          email: doc['Email'] ?? '',
          nooflikes: doc['Number of likes'] ?? 0,
          noofposts: doc['Number of posts'] ?? 0);
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot['Name'],
      email: snapshot['Email'],
      password: snapshot['Password'],
      nooflikes: snapshot['Number of likes'],
      noofposts: snapshot['Number of posts'],
    );
  }

  Stream<List<UserData>> get users {
    return profilecollection.snapshots().map(_userListfromSnapshot);
  }

  Stream<UserData> get userData {
    return profilecollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
