import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_app/utils/colors.dart';

class PostCard extends StatelessWidget {
  final snap;
  const PostCard({required this.snap, super.key});

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
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    snap['profImage']
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snap['username'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
              snap['postUrl'],
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
                    '${snap['likes'].length} likes',
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
                          text: snap['username'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        TextSpan(
                          text: '  ${snap['decription']}',
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
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      'View all 30 comments',
                      style: const TextStyle(fontSize: 16, color: secondaryColor),
                      
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    DateFormat.yMMMd().format(snap['datePublished'].toDate(),),
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
