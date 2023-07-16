import 'package:cloud_firestore/cloud_firestore.dart';


class Post {
  final String decription;
  final String uid;
  final String username;
  final String postId;
  final datePublished;
  final String postUrl;
  final String profImage;
  final likes;

  const Post({
    required this.decription,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });

  Map<String, dynamic> toJson() =>{
    "decription" : decription,
    "uid": uid,
    "username": username,
    "postId": postId,
    "datePublished": datePublished,
    "postUrl": postUrl,
    "profImage": profImage,
    "likes": likes,
  };
  static Post fromSnap(DocumentSnapshot snapshot){
    var snapShot = snapshot.data() as Map<String, dynamic>;
    return Post(
      decription: snapShot["decription"], 
      uid: snapShot["uid"], 
      username: snapShot["username"], 
      postId: snapShot["postId"], 
      datePublished: snapShot["datePublished"], 
      postUrl: snapShot["postUrl"], 
      profImage: snapShot["profImage"],
      likes: snapShot["likes"],
    );
  }
}