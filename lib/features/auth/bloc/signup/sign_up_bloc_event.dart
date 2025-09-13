class SignUpBlocEvent {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpBlocEvent({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}