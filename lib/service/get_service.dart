import 'package:dio/dio.dart';
import 'package:quiz_app/modelQuiz/quizmodel.dart';

Future<List<QuizModel>> getQuiz() async {
  Dio dio = Dio();
  Response response =
      await dio.get('https://6640bc96a7500fcf1a9e91b1.mockapi.io/Quiz');
  List<QuizModel> quizmodel = List.generate(
      response.data.length, (index) => QuizModel.fromMap(response.data[index]));

  return quizmodel;
}
