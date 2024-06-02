import 'package:flutter/material.dart';
import 'package:quiz_app/model/label_text.dart';
import 'package:quiz_app/pages/add_question.dart';
import 'package:quiz_app/model/colors.dart';
import 'package:quiz_app/widgets/answers_container.dart';
import 'package:quiz_app/widgets/question_container.dart';
import '../service/get_service.dart';

PageController controller = PageController();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primayecolor,
      body: Stack(
        children: [
          Positioned(
            left: 217,
            child: Image.asset(thunderbolt),
          ),
          Positioned(
            top: 467,
            left: 4,
            child: Image.asset(thunderbolt),
          ),
          Image.asset(halfcurceulhome),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: FutureBuilder(
              future: getQuiz(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PageView.builder(
                    controller: controller,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: QuestionsContainer(
                                snapshot: snapshot, index: index),
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                AnswersContainer(
                                  snapshot: snapshot,
                                  index: index,
                                  index2: 0,
                                ),
                                AnswersContainer(
                                  snapshot: snapshot,
                                  index: index,
                                  index2: 1,
                                ),
                                AnswersContainer(
                                  snapshot: snapshot,
                                  index: index,
                                  index2: 2,
                                ),
                                AnswersContainer(
                                  snapshot: snapshot,
                                  index: index,
                                  index2: 3,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Positioned(
            top: 500,
            left: 270,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddQuestion()));
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(colors: [
                      secondcolor,
                      primayecolor,
                    ])),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
