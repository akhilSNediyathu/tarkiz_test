part of 'login_bloc_bloc.dart';

@immutable
sealed class LoginBlocState {}

final class LoginBlocInitial extends LoginBlocState {}

final class LoginBlocSuccesState extends LoginBlocState {
  final Driver driver;

  LoginBlocSuccesState({required this.driver});
}

final class LoginBlocErrorState extends LoginBlocState {
  final String error;

  LoginBlocErrorState({required this.error});
}

final class LoginBlocLoadingState extends LoginBlocState {}
