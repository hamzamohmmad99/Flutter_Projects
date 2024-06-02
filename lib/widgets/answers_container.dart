// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_app/model/colors.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/modelQuiz/quizmodel.dart';
import 'package:quiz_app/model/text_style.dart';
import 'package:quiz_app/pages/result.dart';

ValueNotifier<int> correctAnswers = ValueNotifier(0);
ValueNotifier<int> wrongAnswers = ValueNotifier(0);

class AnswersContainer extends StatelessWidget {
  const AnswersContainer({
    super.key,
    required this.snapshot,
    required this.index,
    required this.index2,
  });

  final AsyncSnapshot<List<QuizModel>> snapshot;
  final int index;
  final int index2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          if (snapshot.data![index].indexOfCorrect == index2) {
            ++correctAnswers.value;
          } else {
            ++wrongAnswers.value;
          }
          if (snapshot.data!.length - 1 == index) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Resultpage()),
            );
          } else {
            controller.nextPage(
                duration: const Duration(seconds: 1), curve: Curves.linear);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                snapshot.data![index].answer[index2],
                style: styleanswer,
              )),
        ),
      ),
    );
  }
}
