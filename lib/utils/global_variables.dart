import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app/screens/add_post_screen.dart';
import 'package:social_app/screens/feed_screen.dart';
import 'package:social_app/screens/profile_screen.dart';
import 'package:social_app/screens/search_screen.dart';

const webSreenSize = 600;

List <Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('Notif'),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid,)
];