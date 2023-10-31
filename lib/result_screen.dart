import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/quiz_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswer, required this.resetGame});

  final List<String> choosenAnswer;

  // creating a method to store the correct answers and user answer details
  // Making a list of Map data type store objects in string format
  List<Map<String, Object>> getResultDetails() {
    final List<Map<String, Object>> summary = [];

    // run a for loop to store answers in this list //
    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'index': i,
          'question': questions[i].text,
          'answer': questions[i].answers[0],
          'user-answer': choosenAnswer[i],
        },
      );
    }

    return summary;
  }

  final void Function() resetGame;

  @override
  Widget build(BuildContext context) {
    var summaryData = getResultDetails();
    var totalQuestions = questions.length;
    var correctAnswers = summaryData.where((data) {
      return data['answer'] == data['user-answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(32),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'You answered $correctAnswers out of $totalQuestions questions correctly!',
            style: GoogleFonts.aBeeZee(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          QuestionSummary(getResultDetails()),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: resetGame,
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.aBeeZee(fontSize: 18)),
            icon: const Icon(Icons.restart_alt_rounded),
            label: const Text('Restart Quiz'),
          ),
        ]),
      ),
    );
  }
}

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: data['answer'] == data['user-answer']
                        ? Colors.green
                        : Colors.red,
                    child: Text(
                      ((data['index'] as int) + 1).toString(),
                      style: TextStyle(
                        fontSize: 24,
                        color: data['answer'] == data['user-answer']
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: GoogleFonts.aBeeZee(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            data['user-answer'] as String,
                            style: GoogleFonts.aBeeZee(
                                fontSize: 14,
                                color: Colors.tealAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            data['answer'] as String,
                            style: GoogleFonts.aBeeZee(
                                fontSize: 14,
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
