import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;

  const ContentList({super.key, required this.title,
  required this.contentList,
   this.isOriginals= false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Text(
               title,
         style: const TextStyle(
         color: Colors.white,
         fontSize: 20,
         fontWeight: FontWeight.bold
        ),
        ),
      ),
            Container(
              height: isOriginals ? 500 : 220,
               child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                   itemCount: contentList.length,
                   itemBuilder: (ctx,i){
                      final Content content = contentList[i];
                     return GestureDetector(
                       onTap: ()=> print(content.name),
                       child: Container(
                         margin: const EdgeInsets.symmetric(horizontal: 8),
                         height: isOriginals ? 400 : 200,
                         width: isOriginals ? 200 :130,
                         decoration: BoxDecoration(
                         image: DecorationImage(
                           image: AssetImage(content.imageUrl),
                           fit: BoxFit.cover,
                         ),
                       ),
                       ),
                     ) ;
                   }),
            )
      ]
      ),
    );
  }
}
