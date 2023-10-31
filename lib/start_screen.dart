import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(200, 255, 255, 255),
        ),
        // NOTE: SIZEBOX are used to add some sapce or padding b/w content
        const SizedBox(height: 24),
        Text(
          'Welcome to my Quiz App',
          style: GoogleFonts.aBeeZee(fontSize: 24, color: Colors.white),
        ),
        const SizedBox(height: 24),
        OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.aBeeZee(
                  fontSize: 18,
                )),
            icon: const Icon(Icons.arrow_right_alt_outlined),
            label: const Text('Start Quiz'))
      ]),
    );
  }
}
