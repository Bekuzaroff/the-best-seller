import 'package:best_seller_2/features/auth/bloc/login/logic_event.dart';
import 'package:best_seller_2/features/auth/bloc/login/login_state.dart';
import 'package:best_seller_2/features/auth/repository/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(LoginStateInitial()) {
    on<LoginEvent>((event, emit) async {
      try{
        emit(LoginStateLoading());
        final data = await GetIt.I<LoginRepository>().login(
          email: event.email, 
          password: event.password
        );
        if(data['status'] == 'success'){
          emit(LoginStateSuccess(token: data['data']));
        } else {
          emit(LoginStateError(data['message']));
        }
        
      }catch(e){
        if (e is DioException) {
          emit(LoginStateError(
            '${e.response?.data['message']}'
          ));
        } else {
          emit(LoginStateError(e.toString()));
        }
      }
    });
  }
}