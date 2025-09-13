import 'package:best_seller_2/features/auth/bloc/signup/sign_up_bloc.dart';
import 'package:best_seller_2/features/auth/bloc/signup/sign_up_bloc_event.dart';
import 'package:best_seller_2/features/auth/bloc/signup/sign_up_bloc_state.dart';
import 'package:best_seller_2/shared/widgets/complete_button.dart';
import 'package:best_seller_2/shared/widgets/edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      body: BlocBuilder<SignUpBloc, SignUpState>(
        bloc: GetIt.I<SignUpBloc>(),
        builder: (context, state) {
          if (state is SignUpStateSuccess) {
            Future.delayed( Duration.zero, () async {
              await GetIt.I<SharedPreferences>().setString('access_token', state.token);
            });
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, "/home");
            });
          }
          
          return Stack(
            children: [
              // Основной контент
              SingleChildScrollView(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 70, left: 10, right: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/login");
                          },
                          child: Text(
                            "I have an account", 
                            style: GoogleFonts.inter(
                              color: Theme.of(context).primaryColor, 
                              fontWeight: FontWeight.bold, 
                              fontSize: 14
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          child: Column(
                            children: [
                              SvgPicture.asset('assets/logo.svg', width: 75),
                              EditText(hintText: "username", controller: widget.username_contr),
                              EditText(hintText: "email", controller: widget.email_contr),
                              EditText(hintText: "password", controller: widget.password_contr, obscure_text: true),
                              EditText(hintText: "confirm password", controller: widget.conf_pass_contr, obscure_text: true),
                              CompleteButton(
                                button_text: "Create an account", 
                                on_tap: () {
                                  GetIt.I<SignUpBloc>().add(
                                    SignUpBlocEvent(
                                      username: widget.username_contr.text, 
                                      email: widget.email_contr.text, 
                                      password: widget.password_contr.text, 
                                      confirmPassword: widget.conf_pass_contr.text
                                    )
                                  );
                                },
                              ),
                              if (state is SignUpStateError)
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      state.errorMessage, 
                                      style: TextStyle(color: const Color.fromARGB(255, 255, 92, 80)),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              
              // Оверлей загрузки с темным фоном на ВЕСЬ экран
              if (state is SignUpStateLoading)
                Container(
                  color: Colors.black.withOpacity(0.7), // Темный фон на весь экран
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Creating account...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}