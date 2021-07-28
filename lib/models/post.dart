class Post {
  final String key;
  Post({this.key});
}

class Postdata {
  final String key;
  final String imageURL;
  final String title;
  final String name;
  final int nooflikespost;
  final String uid;
  Postdata({
    this.key,
    this.imageURL,
    this.title,
    this.name,
    this.nooflikespost,
    this.uid,
  });
}
