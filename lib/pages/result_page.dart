import 'package:flutter/material.dart';
import 'package:quis_app/components/color.dart';
import 'package:quis_app/pages/start_page.dart';

class ResultPage extends StatelessWidget {
  final int correctAnswer, wrongAnswer;

  const ResultPage({
    Key? key,
    required this.correctAnswer,
    required this.wrongAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "RESULT",
                style: TextStyle(
                  color: backgroundColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.blue.shade400,
                      offset: const Offset(1.5, 1),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  answerTab("Right answer", correctAnswer),
                  answerTab("Wrong Answer", wrongAnswer),
                ],
              ),
              ElevatedButton(
                onPressed: (() {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const StartQuisPage())),
                    (route) => false,
                  );
                }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: foregroundColor,
                ),
                child: const Text(
                  "Reset Quiz",
                  style: TextStyle(
                    color: backgroundColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget answerTab(String title, int value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "$value",
          style: const TextStyle(
            color: foregroundColor,
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
