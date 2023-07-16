import 'package:cloud_firestore/cloud_firestore.dart';


class Users {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  const Users({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() =>{
    "username" : username,
    "uid": uid,
    "email": email,
    "photoUrl": photoUrl,
    "bio": bio,
    "follower": followers,
    "following": following 
  };

  static Users fromSnap(DocumentSnapshot snapshot){
    var snapShot = snapshot.data() as Map<String, dynamic>;
    return Users(
      email: snapShot["email"], 
      uid: snapShot["uid"], 
      photoUrl: snapShot["photoUrl"], 
      username: snapShot["username"], 
      bio: snapShot["bio"], 
      followers: snapShot["follower"], 
      following: snapShot["following"],
    );
  }
}