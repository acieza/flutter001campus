import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_campus/bloc/auth_bloc.dart';

import 'main_drawer.dart';

// class Contact extends StatelessWidget {
//   const Contact({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text("Eres un Alumno"),
//       ),
//     );
//   }
// }

class User extends StatefulWidget {
  User({Key key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  AuthBloc vueltaBloc;

  @override
  void initState() {
    vueltaBloc = BlocProvider.of<AuthBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
      ),
      drawer: MainDrawner(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UserLoginSuccessState) {
            return Navigator.pushNamed(context, '/user');
          } else if (state is AdminLoginSuccessState) {
            return Navigator.pushNamed(context, '/admin');
          } else if (state is ControlPageState) {
            return Navigator.pushNamed(context, '/login');
          }
        },
        child: Container(
          child: Center(
            child: RaisedButton(
              child: Text('Cerrar sesión'),
              onPressed: () {
                vueltaBloc.add(EliminarToken());
              },
            ),
          ),
        ),
      ),
    );
  }
}
