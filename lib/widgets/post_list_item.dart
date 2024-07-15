import 'package:flutter/material.dart';
import 'package:infite_secroll/model/post_model.dart';

class PostListItem extends StatelessWidget {
   PostListItem({super.key, required this.post});
final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: 
    const EdgeInsets.all(8.0),
    child: ListTile(leading: Text(post.id.toString()),
    title: Text(post.title),
    isThreeLine: true,
    subtitle: Text(post.body),
    ),

    );
  }
}