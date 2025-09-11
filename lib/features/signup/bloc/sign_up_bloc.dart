import 'package:best_seller_2/features/signup/repository/sign_up_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'sign_up_bloc_state.dart';
import 'sign_up_bloc_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpBlocEvent, SignUpBlocInitial> {
  SignUpBloc() : super(SignUpBlocInitial()) {

    on<SignUpBlocEvent>((event, emit) async {
      emit(SignUpBlocLoading());
      
      try{
      var data = await GetIt.I<SignUpRepository>().signUp(
        event.user_name, 
        event.email, 
        event.password, 
        event.confirm_password
        );
       
      if(data['status'] == 'success'){
        emit(SignUpBlocSuccess(token: data['data']));
      } else {
        print(data);
        emit(SignUpBlocError(data['message']));
      }
      }catch(e){
        if (e is DioException) {
          emit(SignUpBlocError(
            '${e.response?.data['message']}'
          ));
        } else {
          emit(SignUpBlocError(e.toString()));
        }
      }
    });
  }
}