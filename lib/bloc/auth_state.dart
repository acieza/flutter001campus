part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoginInitialState extends AuthState {}

class UserLoginSuccessState extends AuthState {}

class AdminLoginSuccessState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginErrorState extends AuthState {
  final String message;
  LoginErrorState({this.message});
}

class NombreUserState extends AuthState {
  final String message;
  NombreUserState({this.message});
}

class ControlPageState extends AuthState {}
