import 'package:flutter/material.dart';

import 'package:quiz_app/model/colors.dart';
import 'package:quiz_app/model/label_text.dart';
import 'package:quiz_app/modelQuiz/quizmodel.dart';
import 'package:quiz_app/service/add_question_service.dart';
import 'package:quiz_app/widgets/auth_text_field.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  TextEditingController question = TextEditingController();

  TextEditingController answerone = TextEditingController();

  TextEditingController answertow = TextEditingController();

  TextEditingController answerthree = TextEditingController();

  TextEditingController answerfour = TextEditingController();

  TextEditingController indexOfCorrect = TextEditingController();

  ValueNotifier<int> indxeofcorrect = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AuthTextField(
                  prefixIcon:  Icon(Icons.question_mark_rounded,color:primayecolor ,),
                  hintText: hintaddquestion,
                  controller: question),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AuthTextField(
                  prefixIcon:  Icon(Icons.question_answer,color:primayecolor ,),
                  hintText: hintaddanswersA,
                  controller: answerone),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AuthTextField(
                  prefixIcon:  Icon(Icons.question_answer,color:primayecolor ,),
                  hintText: hintaddanswersB,
                  controller: answertow),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AuthTextField(
                  prefixIcon:  Icon(Icons.question_answer,color:primayecolor ),
                  hintText: hintaddanswersC,
                  controller: answerthree),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AuthTextField(
                  prefixIcon:  Icon(Icons.question_answer,color:primayecolor ),
                  hintText: hintaddanswersD,
                  controller: answerfour),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AuthTextField(
                  prefixIcon:  Icon(Icons.add_task,color:primayecolor),
                  hintText: hintaddindexcorrcetanswer,
                  controller: indexOfCorrect),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () async {
                  await AddQuestionImp().addIn(
                    QuizModel(
                      question: question.text,
                      answer: [
                        answerone.text,
                        answertow.text,
                        answerthree.text,
                        answerfour.text
                      ],
                      indexOfCorrect: int.parse(indexOfCorrect.text),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: primayecolor),
                  height: 70,
                  width: 100,
                  child: Icon(
                    Icons.add,
                    color: secondcolor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
