import 'package:flutter/material.dart';
import 'package:netflix_ui_app/data/data.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 // const HomeScreen({Key? key}) : super(key: key);
 //    ScrollController? _scrollController;
 //
 //  double _scrollOffset =0.0;
 //  @override
 //  void initState() {
 //     _scrollController =ScrollController()..addListener((){
 //       setState(() {
 //         _scrollController =_scrollController.offset ;
 //       });
 //     });
 //    super.initState();
 //  }
 //
 //  @override
 //  void dispose() {
 //    _scrollController.dispose();
 //    super.dispose();
 //  }

  @override
  Widget build(BuildContext context) {
    final  screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () => print ('cast'),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: CustomAppBar(),
      ),
      body: CustomScrollView(
        controller:null,
        slivers: [
         SliverToBoxAdapter(
           child: ContentHeader(featuredContent: sintelContent,)
         ),
          SliverPadding(padding:EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: Previews(
                title: 'Previews',
                    contentList: previews,
              )
            ),

          ),
          SliverToBoxAdapter(
            child: ContentList(
             title: 'My List',
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: 'Netflix Originals',
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: 'Trending',
              contentList: trending,

            ),
          ),


        ],
      ),
    );
  }
}


