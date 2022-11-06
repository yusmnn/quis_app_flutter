import 'package:flutter/material.dart';
import 'package:quis_app/components/color.dart';
import 'package:quis_app/components/quis_question.dart';
import 'package:quis_app/pages/result_page.dart';

import '../widgets/alert_option.dart';

class PlayQuisPage extends StatefulWidget {
  const PlayQuisPage({super.key});

  @override
  State<PlayQuisPage> createState() => _PlayQuisPageState();
}

class _PlayQuisPageState extends State<PlayQuisPage> {
  String correctAnswer = "", selectedAnswer = "";
  int curentIndex = 0, correctAnswers = 0, wrongAnswers = 0;
  //* validate quis

  bool isAnswerLocked = false;

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: backgroundColor),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Play Quiz",
          style: TextStyle(
            color: backgroundColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.blueAccent.shade100,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff005AA7),
              Color.fromARGB(255, 133, 167, 223),
            ],
          ),
        ),
        child: PageView.builder(
          controller: pageController,
          itemCount: quisQuestions.length,
          itemBuilder: (context, index) {
            QuisQuestionModel model = quisQuestions[index];

            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      model.question,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: List.generate(
                      model.options.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isAnswerLocked = true;
                              selectedAnswer = model.options[index];
                              correctAnswer = model.correctAnswer;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: foregroundColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: selectedAnswer == model.options[index]
                                  ? foregroundColor
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(14),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              model.options[index],
                              style: TextStyle(
                                color: selectedAnswer == model.options[index]
                                    ? Colors.white
                                    : foregroundColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 133, 167, 223),
              Color.fromARGB(255, 133, 167, 230),
            ],
          ),
        ),
        child: InkWell(
          onTap: () {
            if (isAnswerLocked) {
              if (selectedAnswer == correctAnswer) {
                correctAnswers++;
              } else {
                wrongAnswers++;
              }

              curentIndex++;

              if (curentIndex != quisQuestions.length) {
                pageController.jumpToPage(curentIndex);
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      correctAnswer: correctAnswers,
                      wrongAnswer: wrongAnswers,
                    ),
                  ),
                );
              }
              debugPrint("correct Answer: $correctAnswers");
              debugPrint("Wrong Answer: $wrongAnswers");
            } else {
              showDialog(
                context: context,
                builder: ((context) {
                  return const AlertOption();
                }),
              );

              debugPrint("Select Option");
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              child: Container(
                decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   begin: Alignment.topRight,
                    //   end: Alignment.bottomLeft,
                    //   colors: [
                    //     Color(0xff005AA7),
                    //     Color(0xff0052D4),
                    //   ],
                    // ),
                    color: const Color(0xFF0E3311).withOpacity(0.5)),
                height: 70,
                alignment: Alignment.center,
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: foregroundColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
