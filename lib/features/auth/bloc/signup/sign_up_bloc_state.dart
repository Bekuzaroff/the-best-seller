class SignUpState {}
class SignUpStateInitial extends SignUpState {}
class SignUpStateLoading extends SignUpState {}
class SignUpStateSuccess extends SignUpState {
  final String token;
  SignUpStateSuccess({this.token = ''});
}
class SignUpStateError extends SignUpState {
  final String errorMessage;
  SignUpStateError(this.errorMessage);
}