import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditText extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final obscure_text;
  const EditText({
    super.key,
    this.hintText = "Search",
    this.controller,
    this.obscure_text = false
  });

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14, left: 20, right: 20),
        child: TextField(
          obscureText: widget.obscure_text,
          cursorColor: Theme.of(context).primaryColor,
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).cardTheme.color,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              borderSide: BorderSide(width: 0, color: Colors.transparent)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              borderSide: BorderSide(width: 0, color: Colors.transparent)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              borderSide: BorderSide(width: 0, color: Colors.transparent)
            ),
            hintText: widget.hintText,
            hintStyle: GoogleFonts.inter(color: Theme.of(context).primaryColor, 
            fontSize: 14, fontWeight: FontWeight.bold),
            
          ),
          
        ),
      );
  }
}