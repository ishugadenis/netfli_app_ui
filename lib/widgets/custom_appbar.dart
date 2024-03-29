import 'package:flutter/material.dart';
import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({Key? key,  this.scrollOffset=0.0,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 24,
      ) ,
      color:  Colors.black.withOpacity(scrollOffset/350.clamp(0, 1).toDouble()),
       child: SafeArea(
         child: Row(
           children: <Widget>[
             Image.asset(Assets.netflixLogo0),
             const SizedBox(width: 12,),
             Expanded(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                  _AppBarButton(title: 'Tv Shows', onTap: ()=>print('Tv Showws')),
                   _AppBarButton(title: 'Movies', onTap: ()=>print('Movies')),
                   _AppBarButton(title: 'My List', onTap: ()=>print('My List'))
                 ],
               ),
             )
           ],
         ),
       ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AppBarButton({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:() => onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
