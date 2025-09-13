class LoginState {}
class LoginStateInitial extends LoginState {}
class LoginStateLoading extends LoginState {}
class LoginStateSuccess extends LoginState {
  final String token;
  LoginStateSuccess({this.token = ''});
}
class LoginStateError extends LoginState {
  final String errorMessage;
  LoginStateError(this.errorMessage);
}