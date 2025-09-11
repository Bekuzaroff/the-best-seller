class SignUpBlocEvent {
  final String user_name;
  final String email;
  final String password;
  final String confirm_password;

  SignUpBlocEvent({
    required this.user_name,
    required this.email,
    required this.password,
    required this.confirm_password,
  });
}