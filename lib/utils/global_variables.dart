import 'package:flutter/material.dart';
import 'package:social_app/screens/add_post_screen.dart';
import 'package:social_app/screens/feed_screen.dart';

const webSreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  Text('search'),
  AddPostScreen(),
  Text('Notif'),
  Text('profile')
];