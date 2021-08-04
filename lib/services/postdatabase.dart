import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trial/models/post.dart';

class PostDatabaseService {
  final CollectionReference postcollection =
      FirebaseFirestore.instance.collection('postdata');
  Future updatePostdata(String? imageURL, String title, String? name,
      int nooflikespost, String? uid) async {
    DocumentReference docRef = postcollection.doc();
    return docRef.set({
      'docId': docRef.id,
      'ImageURL': imageURL,
      'Title': title,
      'Name': name,
      'Number of likes': nooflikespost,
      'Userid': uid,
    });
  }

  List<Postdata> _postListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Postdata(
        key: doc['docId'],
        imageURL: doc['Image URL'] ?? '',
        title: doc['Title'] ?? '',
        name: doc['Name'] ?? '',
        nooflikespost: doc['Number of likes'] ?? 0,
        uid: doc['User id'] ?? '',
      );
    }).toList();
  }

  Postdata _postDataFromSnapshot(DocumentSnapshot snapshot) {
    return Postdata(
        key: snapshot['docId'],
        imageURL: snapshot['Image URL'],
        title: snapshot['Title'],
        name: snapshot['Name'],
        nooflikespost: snapshot['Number of likes'],
        uid: snapshot['User id']);
  }

  Stream<List<Postdata>> get posts {
    return postcollection.snapshots().map(_postListfromSnapshot);
  }

  Stream<Postdata> get postData {
    return postcollection.doc().snapshots().map(_postDataFromSnapshot);
  }
}
