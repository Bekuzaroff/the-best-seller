class SignUpBlocInitial {}
class SignUpBlocLoading extends SignUpBlocInitial {}
class SignUpBlocSuccess extends SignUpBlocInitial {
  final String token;
  SignUpBlocSuccess({this.token = ''});
}
class SignUpBlocError extends SignUpBlocInitial {
  final String errorMessage;
  SignUpBlocError(this.errorMessage);
}