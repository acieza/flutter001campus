import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_campus/repository/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository repo;
  AuthBloc(AuthState initialState, this.repo) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    var pref = await SharedPreferences.getInstance();

    if (event is StartEvent) {
      yield LoginInitialState();
    } else if (event is LoginButtonPress) {
      yield AuthInitial();
      var data = await repo.login(event.email, event.password);

      if (data['usuarioLogin']['role'] == "user") {
        pref.setString('token', data['token']);
        pref.setString('role', data['usuarioLogin']['role']);
        pref.setString('_id', data['usuarioLogin']['_id']);
        pref.setString('nombre', data['usuarioLogin']['nombre']);
        pref.setString('email', data['usuarioLogin']['email']);
        pref.setString('img', data['usuarioLogin']['img']);
        yield UserLoginSuccessState();
      } else if (data['usuarioLogin']['role'] == "admin" ||
          data['usuarioLogin']['role'] == "profesor") {
        pref.setString('token', data['token']);
        pref.setString('role', data['usuarioLogin']['role']);
        pref.setString('_id', data['usuarioLogin']['_id']);
        pref.setString('nombre', data['usuarioLogin']['nombre']);
        pref.setString('email', data['usuarioLogin']['email']);
        pref.setString('img', data['usuarioLogin']['img']);
        yield AdminLoginSuccessState();
      } else {
        yield LoginErrorState(message: data['msg'][0]);
      }
    } else if (event is ComprobarPaginas) {
      if (pref.getString('token') == null) {
        yield LoginInitialState();
      } else {
        if (pref.getString('role') == 'user') {
          yield UserLoginSuccessState();
        } else if (pref.getString('role') == 'admin' ||
            pref.getString('role') == 'profesor') {
          yield AdminLoginSuccessState();
        }
      }
    } else if (event is EliminarToken) {
      pref.clear();
      yield ControlPageState();
    } else if (event is NombreUserToken) {
      yield NombreUserState(message: pref.getString('nombre'));
    }
  }
}
