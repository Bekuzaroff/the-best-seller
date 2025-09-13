import 'package:best_seller_2/features/auth/bloc/login/logic_event.dart';
import 'package:best_seller_2/features/auth/bloc/login/login_bloc.dart';
import 'package:best_seller_2/features/auth/bloc/login/login_state.dart';
import 'package:best_seller_2/shared/widgets/complete_button.dart';
import 'package:best_seller_2/shared/widgets/edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
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
      body: BlocBuilder<LoginBloc, LoginState>(
        bloc: GetIt.I<LoginBloc>(),
        builder: (context, state) {
          if (state is LoginStateSuccess) {
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
                            Navigator.pushReplacementNamed(context, "/account");
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
                              EditText(hintText: "email", controller: widget.email_contr),
                              EditText(hintText: "password", controller: widget.password_contr, obscure_text: true),
                              CompleteButton(
                                button_text: "Create an account", 
                                on_tap: () {
                                  GetIt.I<LoginBloc>().add(
                                    LoginEvent(
                                      email: widget.email_contr.text, 
                                      password: widget.password_contr.text, 
                                    )
                                  );
                                },
                              ),
                              if (state is LoginStateError)
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
              if (state is LoginStateLoading)
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
                          'Login...',
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