import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infite_secroll/bloc/posts_bloc.dart';
import 'package:infite_secroll/config/observer_bloc.dart';
import 'package:infite_secroll/pages/post_page.dart';


void main(List<String> args) {
  Bloc.observer=MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
     create: (_) =>PostsBloc()..add(GetPostsEvent()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PostPage(),
      ),
    );
   
  }
  }

