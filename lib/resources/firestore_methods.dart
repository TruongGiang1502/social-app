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
  Future<String> likePost(String postID, String uid, List likes) async {
    String res = "Some error occured";
    try {
      if(likes.contains(uid)){
        await _firestore.collection('posts').doc(postID).update({
          'likes' : FieldValue.arrayRemove([uid]),
        });
      } 
      else {
        await _firestore.collection('posts').doc(postID).update({
          'likes' : FieldValue.arrayUnion([uid]),
        });
      }

    } catch(e){
      res = e.toString();
    }
    return res;
  }

  Future <String> postComment(String postId, String text, String uid, String name, String profilePic) async {
    String res = "Some error occurred";
    try {
      if (text.isNotEmpty) {
        // if the likes list contains the user uid, we need to remove it
        String commentId = const Uuid().v1();
        _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'name': name,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
        res = 'success';
      } else {
        res = "Please enter text";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //delete post

  Future <String> deletePost (String postId) async {
    String res = "Some error occured";
    try {
      await _firestore.collection('posts').doc(postId).delete();
    } catch (err){
      res = err.toString();
    }
    return res;
  } 
}
