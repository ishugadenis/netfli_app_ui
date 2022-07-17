import 'package:flutter/material.dart';
import 'package:netflix_ui_app/data/data.dart';
import '../widgets/widgets.dart';
import '../cubits/cubits.dart';
import 'package:bloc/bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}): super(key:key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //   ScrollController? _scrollController;
  //
  // @override
  // void initState() {
  //    _scrollController =ScrollController()..addListener((){
  //
  //      context.watch<AppBarCubit>().setOffset(_scrollController);
  //    });
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   _scrollController!.dispose();
  //   super.dispose();
  // }

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
                key: PageStorageKey('myList'),
                title: 'Previews',
                    contentList: previews,
              )
            ),

          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('myList'),
             title: 'My List',
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('originals'),
              title: 'Netflix Originals',
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key:PageStorageKey('trending'),
              title: 'Trending',
              contentList: trending,

            ),
          ),


        ],
      ),
    );
  }
}


