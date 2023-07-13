import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:social_app/resources/auth_methods.dart';
import 'package:social_app/utils/colors.dart';
import 'package:social_app/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();
  final TextEditingController _bioControler = TextEditingController();
  final TextEditingController _usernameControler = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailControler.dispose();
    _passwordControler.dispose();
    _usernameControler.dispose();
    _bioControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              //logo app
              SvgPicture.asset(
                'assets/images/ic_instagram.svg',
                height: 64,
                colorFilter:
                    const ColorFilter.mode(primaryColor, BlendMode.srcIn),
              ),
              const SizedBox(height: 64),
              //circular widget to acecpt and show our selected file
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1688406434758-28b7b2ebbdc0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=388&q=80'),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              //textfield username input
              TextFieldInput(
                  textEditingController: _usernameControler,
                  hintText: 'Enter you username',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(height: 20),

              //textfield email input
              TextFieldInput(
                  textEditingController: _emailControler,
                  hintText: 'Enter your email',
                  textInputType: TextInputType.text),
              const SizedBox(height: 20),

              //textfield password input
              TextFieldInput(
                textEditingController: _passwordControler,
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 20),

              //textfield input bio
              TextFieldInput(
                  textEditingController: _bioControler,
                  hintText: 'Enter your bio',
                  textInputType: TextInputType.text),
              const SizedBox(height: 20),

              InkWell(
                //Login button
                onTap: () async { 
                  String res = await AuthMethods().signupUSer(
                    email: _emailControler.text,
                    password: _passwordControler.text,
                    username: _usernameControler.text,
                    bio: _bioControler.text,
                    //file: _image
                  );
                  print(res);
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      color: blueColor),
                  child: const Text('Sign up'),
                ),
              ),
              const SizedBox(height: 10),
              Flexible(
                flex: 2,
                child: Container(),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //text
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      "Don't you have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  //Come to Signup Screen button
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
