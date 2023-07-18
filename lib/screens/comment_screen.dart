import 'package:flutter/material.dart';
import 'package:social_app/utils/colors.dart';
import 'package:social_app/widgets/comment_card.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comments'),
        centerTitle: false,
      ),
      body: CommentCard(),

      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin: EdgeInsets.only(
            bottom:  MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: const EdgeInsets.only(
            left: 16,
            right: 8
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://scontent.fvca1-2.fna.fbcdn.net/v/t39.30808-6/345628793_204357835813979_5643541042344270747_n.jpg?stp=dst-jpg_s1080x2048&_nc_cat=104&cb=99be929b-3346023f&ccb=1-7&_nc_sid=a4a2d7&_nc_ohc=hv2zEtNtzN8AX_Tgqhr&_nc_ht=scontent.fvca1-2.fna&oh=00_AfBTbY3k4U0tyL3M2Z30K0C_sLUC674jRNVUE5o01JK3QQ&oe=64BB23A8'
                ),
                radius: 18,
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Comment as username',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: (){},
                child: Container(
                  padding: const  EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: const Text('Post', style: TextStyle(
                    color: Colors.blueAccent,
                  ),),
                ),
              ),

            ],
          ),
        )
      ),
    );
  }
}