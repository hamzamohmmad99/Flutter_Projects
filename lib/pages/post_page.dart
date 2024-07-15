

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infite_secroll/bloc/posts_bloc.dart';
import 'package:infite_secroll/widgets/loading_widget.dart';
import 'package:infite_secroll/widgets/post_list_item.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final scrollController=ScrollController();
  void initSate() {
  super.initState();
  scrollController.addListener(onScroll);
  }
@override
  void dispose(){
  scrollController..removeListener(onScroll)
  ..dispose();
  super.dispose();
}


  void onScroll(){
   final maxScroll= scrollController.position.maxScrollExtent;
  final currentScroll=  scrollController.offset;
  if(currentScroll>=maxScroll*0.9){
    context.read<PostsBloc>().add(GetPostsEvent());
  }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('posts'),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          switch (state.status) {
            case PostsStatus.loading:
              return const LoadingWidget();
            case PostsStatus.success:
              return ListView.builder(
                controller: scrollController,
                itemCount: state.hasreachedMax?state.posts.length:state.posts.length+1,
                itemBuilder: (BuildContext context, int index) {
               return   index>=state.posts.length?const LoadingWidget():
                   PostListItem(post: state.posts[index]);
                },
              );
            case PostsStatus.error:
              return Center(
                child: Text(state.errorMessage),
              );
          }
        },
      ),
    );
  }
}
