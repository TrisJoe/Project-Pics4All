import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trial/models/post.dart';

class PostDatabaseService {
  final String key;
  PostDatabaseService({this.key});
  final CollectionReference postcollection =
      Firestore.instance.collection('postdata');
  Future updatePostdata(String imageURL, String title, String name,
      int nooflikespost, String uid) async {
    return await postcollection.document(key).setData({
      'ImageURL': imageURL,
      'Title': title,
      'Name': name,
      'Number of likes': nooflikespost,
      'Userid': uid,
    });
  }

  List<Postdata> _postListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Postdata(
        imageURL: doc.data['Image URL'] ?? '',
        title: doc.data['Title'] ?? '',
        name: doc.data['Name'] ?? '',
        nooflikespost: doc.data['Number of likes'] ?? 0,
        uid: doc.data['User id'] ?? '',
      );
    }).toList();
  }

  Postdata _postDataFromSnapshot(DocumentSnapshot snapshot) {
    return Postdata(
        key: key,
        imageURL: snapshot.data['Image URL'],
        title: snapshot.data['Title'],
        name: snapshot.data['Name'],
        nooflikespost: snapshot.data['Number of likes'],
        uid: snapshot.data['User id']);
  }

  Stream<List<Postdata>> get posts {
    return postcollection.snapshots().map(_postListfromSnapshot);
  }

  Stream<Postdata> get postData {
    return postcollection.document(key).snapshots().map(_postDataFromSnapshot);
  }
}
