import 'package:flutter/material.dart';
import 'package:social_app/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          //header section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1671586882920-8cd59c84cdfe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Z2lybHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'username',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context, 
                      builder: (context) => 
                      Dialog(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shrinkWrap: true,
                          children: [
                            'Delete',
                          ].map((e) => InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16
                              ),
                              child: Text(e),
                            ),
                          ),
                          ).toList(),
                        ),
                      )
                    );
                  }, 
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ), 
          ),
          //image section
          SizedBox(
            height: MediaQuery.of(context).size.height*0.35,
            width: double.infinity,
            child: Image.network(
              'https://plus.unsplash.com/premium_photo-1671586882051-fa5d61654bc5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjV8fGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
              fit: BoxFit.cover,
            )
          ),

          //interact like section
          Row(
            children: [
              IconButton(
                onPressed: (){}, 
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.mode_comment_rounded),
                //color: Colors.red,
              ),
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.send),
                //color: Colors.red,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: (){}, 
                    icon: const Icon(Icons.bookmark_border),
                    //color: Colors.red,
                  ),
                ),
              ),
            ],
          ),

          //deciption and comment nuber
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w800
                  ),
                  child: Text(
                    '129 likes',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: primaryColor),
                      children: [
                        TextSpan(
                          text: 'username ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        TextSpan(
                          text: 'Em đẹp em xinh em, anh có yêu em không? Chứ em gất là yêu anh',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ]
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      'View all 30 comments',
                      style: const TextStyle(fontSize: 16, color: secondaryColor),
                      
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '18/07/2023',
                    style: const TextStyle(fontSize: 16, color: secondaryColor),
                    
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
