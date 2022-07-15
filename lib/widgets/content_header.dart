import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({super.key, required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
       children: [
         Container(
           height: 500.0,
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage(
                 featuredContent.imageUrl,
               ),
               fit: BoxFit.cover,
             )
           ),
         ),
         Container(
           height: 500.0,
           decoration: BoxDecoration(
             gradient: LinearGradient(
               colors: [Colors.black,Colors.transparent],
               begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
             )
           ),
         ),
         Positioned(
           bottom: 110.0,
           child: SizedBox(
             width: 250,
             child: Image.asset(featuredContent.titleImageUrl),


           ),
         ),
         Positioned(
           left: 0,
             right: 0,
           bottom: 40,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               VerticalIconButton(
                 icon:Icons.add,
                 title:'List',
                 onTap: () => print('My List'),
               ),
               _PlayButton(),
               VerticalIconButton(
                 icon:Icons.info_outline,
                 title:'Info',
                 onTap: () => print('Info'),
               )
             ],
           ),
         )

    ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
        padding:const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
        onPressed:()=> print('Play'),
        icon: const Icon(Icons.play_arrow),
        color: Colors.white,
        label: const Text(
          'Play',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600

          ),
        )
    );
  }
}

