class QuisQuestionModel {
  final String question;
  final String correctAnswer;

  final List<String> options;

  QuisQuestionModel(
      {required this.question,
      required this.correctAnswer,
      required this.options});
}

List<QuisQuestionModel> quisQuestions = [
  QuisQuestionModel(
    question: "What is Flutter",
    correctAnswer: "Framework",
    options: [
      "Programming Language",
      "Cake",
      "Framework",
      "Crypto",
    ],
  ),
  QuisQuestionModel(
    question: "What is the programming language used Flutter",
    correctAnswer: "Dart",
    options: [
      "Java",
      "Kotlin",
      "Dart",
    ],
  ),
  QuisQuestionModel(
    question:
        "Flutter is an open source framework by Google for building multi-platform applications from a single codebase",
    correctAnswer: "True",
    options: [
      "True",
      "False",
    ],
  ),
  QuisQuestionModel(
    question: "1 + 1",
    correctAnswer: "0",
    options: [
      "11",
      "2",
      "1",
      "0",
    ],
  ),
  QuisQuestionModel(
    question: "Who is the 2022 Ballon D'OR! ✨",
    correctAnswer: "Karim Benzema",
    options: [
      "Penaldo",
      "Pessi",
      "Karim Benzema",
      "Harry Maguire",
    ],
  ),
];
