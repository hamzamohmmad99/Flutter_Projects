import 'dart:async';

import 'package:dio/dio.dart';

import 'package:infite_secroll/model/post_model.dart';

class Service {
  static Future<List<PostModel>> getPosts(
      [int startIndex = 0, int limit = 20]) async {
    Dio dio = Dio();
      String bauesurl =
          'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit';
    try {
      Response response = await dio.get(bauesurl);
      print(response.data);
      if (response.statusCode == 200) {
              List<PostModel> postsmodel = List.generate(
        response.data.length,
        (index) => PostModel.fromMap(
          response.data[index],
        ),
      );

      return postsmodel;
      }else{
        return [
          PostModel(id: 1, title: 'title', body: 'body'),
        ];
      }

    } catch (e) {
      throw e;
    }
  }
}
