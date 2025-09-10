import 'package:best_seller_2/shared/widgets/complete_button.dart';
import 'package:best_seller_2/shared/widgets/edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  final TextEditingController username_contr = TextEditingController();
  final TextEditingController email_contr = TextEditingController();
  final TextEditingController password_contr = TextEditingController();
  final TextEditingController conf_pass_contr = TextEditingController();
  
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 70, left: 10, right: 10, bottom: 10),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushReplacementNamed(context, "/login");
              },
              child: Text("I have an account", 
            style: GoogleFonts.inter(color: Theme.of(context).primaryColor, 
            fontWeight: FontWeight.bold, fontSize: 14)
            ),
          ),

            Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  SvgPicture.asset('assets/logo.svg', width: 75),
                  EditText(hintText: "username", controller:widget.username_contr),
                  EditText(hintText: "email", controller:widget.email_contr),
                  EditText(hintText: "password", controller:widget.password_contr, obscure_text: true,),
                  EditText(hintText: "confirm password", controller:widget.conf_pass_contr, obscure_text: true,),
                  CompleteButton(button_text: "Create an account",)
                ],
              ),
            )
          ],
          ),
        ),
      ),
      )
    );
  }
}