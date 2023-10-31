import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBTN extends StatelessWidget {
  const CustomBTN({super.key, required this.text, required this.onClick});

  final String text;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 20,
            ),
            backgroundColor: const Color.fromARGB(200, 250, 65, 125),
            foregroundColor: Colors.white,
            // Adding the Border Radius around buttons //
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            textStyle: GoogleFonts.aBeeZee(fontSize: 18)),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
