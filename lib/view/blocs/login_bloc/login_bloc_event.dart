part of 'login_bloc_bloc.dart';

@immutable
sealed class LoginBlocEvent {}

class OnLoginButtonClickEvent extends LoginBlocEvent {
  final String email;
  final String password;

  OnLoginButtonClickEvent({required this.email, required this.password});
}