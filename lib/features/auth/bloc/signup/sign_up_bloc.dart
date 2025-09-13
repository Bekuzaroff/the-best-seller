import 'package:best_seller_2/features/auth/repository/sign_up_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'sign_up_bloc_state.dart';
import 'sign_up_bloc_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpBlocEvent, SignUpState> {
  SignUpBloc() : super(SignUpStateInitial()) {

    on<SignUpBlocEvent>((event, emit) async {
      emit(SignUpStateLoading());
      
      try{
      var data = await GetIt.I<SignUpRepository>().signUp(
        event.username, 
        event.email, 
        event.password, 
        event.confirmPassword
        );
       
      if(data['status'] == 'success'){
        emit(SignUpStateSuccess(token: data['data']));
      } else {
        print(data);
        emit(SignUpStateError(data['message']));
      }
      }catch(e){
        if (e is DioException) {
          emit(SignUpStateError(
            '${e.response?.data['message']}'
          ));
        } else {
          emit(SignUpStateError(e.toString()));
        }
      }
    });
  }
}