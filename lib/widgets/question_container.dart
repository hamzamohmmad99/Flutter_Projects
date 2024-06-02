// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_app/model/colors.dart';
import 'package:quiz_app/modelQuiz/quizmodel.dart';
import '../model/text_style.dart';

class QuestionsContainer extends StatelessWidget {
  const QuestionsContainer({
    super.key,
    required this.snapshot,
    required this.index,
  });
  final AsyncSnapshot<List<QuizModel>> snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [threecolor, secondcolor],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          snapshot.data![index].question,
          style: stylequstions,
        ),
      ),
    );
  }
}
