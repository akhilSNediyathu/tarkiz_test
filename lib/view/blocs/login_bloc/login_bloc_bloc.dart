// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:driver_dxb/model/driver_model.dart';

import 'package:driver_dxb/repo/mainrepo.dart';
import 'package:meta/meta.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc() : super(LoginBlocInitial()) {
    on<LoginBlocEvent>((event, emit) {});
    on<OnLoginButtonClickEvent>((event, emit) async {
      emit(LoginBlocLoadingState());
      try {
        final response =
            await ApiService().driverLogin(event.email, event.password);
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final driver = Driver.fromJson(data['data']);
          emit(LoginBlocSuccesState(driver: driver));
        } else {
          emit(LoginBlocErrorState(error: 'Invalid credentials'));
        }
      } catch (e) {
        emit(LoginBlocErrorState(error: 'An error occurred'));
      }
    });
  }
}
