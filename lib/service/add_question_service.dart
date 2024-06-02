import 'package:dio/dio.dart';

import 'package:quiz_app/modelQuiz/quizmodel.dart';


abstract class AddQuestionService{
  Dio dio=Dio();
  late Response response;
  String basurl='https://6640bc96a7500fcf1a9e91b1.mockapi.io/Quiz';

Future <bool>addIn(QuizModel quiz);
}
class AddQuestionImp extends AddQuestionService{
  @override
  Future<bool> addIn(QuizModel quiz) async{
    try {
      response = await dio.post(basurl,data:quiz.toMap() );
     if(response.statusCode==201){
      
       return true;
     } else{
      
        return false;
     }

    }on DioException catch(e){
        print(e.message);
        return true;

    }
   
  }

}