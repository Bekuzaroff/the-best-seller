import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompleteButton extends StatelessWidget {
  final button_text;
  final Function on_tap;
  const CompleteButton({super.key, this.button_text = "complete", this.on_tap = CompleteButton.printf});

  static printf() {
    print('hello');
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        on_tap();
      },
      child: Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(3))
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Text(button_text , style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15
          )),
        ),
      ),
    ),
    );
  }
}