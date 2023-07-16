import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> uploadPost(
    String decription,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = 'Some error occurred';
    try{
      String photoUrl = await StorageMethods().uploadImageToStorage('posts', file, true);

      String postId = const Uuid().v1();
      Post post = Post(
        decription: decription, 
        uid: uid, 
        username: username, 
        postId: postId, 
        datePublished: DateTime.now(), 
        postUrl: photoUrl, 
        profImage: profImage, 
        likes: []
      );
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (err){
      res = err.toString();
    }
    return res;
  }
}
