import 'package:best_seller_2/shared/widgets/complete_button.dart';
import 'package:best_seller_2/shared/widgets/edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  final TextEditingController email_contr = TextEditingController();
  final TextEditingController password_contr = TextEditingController();
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.email_contr.dispose();
    widget.password_contr.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 70, left: 10, right: 10, bottom: 10),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushReplacementNamed(context, "/account");
              },
              child: Text("I do not have an account", 
            style: GoogleFonts.inter(color: Theme.of(context).primaryColor, 
            fontWeight: FontWeight.bold, fontSize: 14)
            ),
          ),

            Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  SvgPicture.asset('assets/logo.svg', width: 75),
                  EditText(hintText: "email", controller: widget.email_contr),
                  EditText(hintText: "password", controller: widget.password_contr, obscure_text: true,),
                  CompleteButton(button_text: "Login",)
                ],
              ),
            )
          ],
          ),
        ),
      )
    );
  }
}