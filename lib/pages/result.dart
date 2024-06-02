import 'package:flutter/material.dart';
import 'package:quiz_app/config/get_it.dart';
import 'package:quiz_app/model/colors.dart';
import 'package:quiz_app/model/label_text.dart';
import 'package:quiz_app/model/text_style.dart';
import 'package:quiz_app/widgets/answers_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
int correctasers=correctAnswers.value;
int wronganswers=wrongAnswers.value;

String name=core.get<SharedPreferences>().getString('user').toString();
class Resultpage extends StatelessWidget {
   const Resultpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
         result,
          style: stylequstions,
        ),
        backgroundColor:primayecolor,
      ),
      backgroundColor: primayecolor,
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color:containerresuultcolor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Text('Mr. $name', style: stylename),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('The Correct Answers is $correctasers',style: stylecorrectanswers,),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('The Wrong Answers is $wronganswers',style: stylewronganswers,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
