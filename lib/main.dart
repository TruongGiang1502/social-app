import 'package:flutter/material.dart';
// import 'package:social_app/responsive/mobile_screen_layout.dart';
// import 'package:social_app/responsive/responsive_layout.dart';
// import 'package:social_app/responsive/web_screen_layout.dart';
import 'package:social_app/screens/login_screen.dart';
import 'package:social_app/screens/sign_up_screen.dart';
import 'package:social_app/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
      //home: const ResponsiveLayout(webScreenLayout: WebScreenLayout(), mobileScreenLayout: MobileScreenLayout()),
      home: const SignUpScreen(),
    );
  }
}

