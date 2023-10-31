import 'package:flutter/material.dart';
import 'package:quizapp/custom_btn.dart';
import 'package:quizapp/data/quiz_data.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<Questions> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<Questions> {
  var index = 0;

  void answerQuestion(String answer) {
    // To access the function onSelectAnswer defined in StatefulWidget we user buit in widget method
    widget.onSelectAnswer(answer);

    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[index];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(32),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ...currentQuestion.getShuffledAnswers().map((item) {
                return CustomBTN(
                    text: item,
                    onClick: () {
                      answerQuestion(item);
                    });
              }),
            ]),
      ),
    );
  }
}
