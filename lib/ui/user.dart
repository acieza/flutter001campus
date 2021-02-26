import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_campus/bloc/auth_bloc.dart';
import 'package:flutter_campus/models/curso.dart';
import 'package:flutter_campus/repository/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cursoslist.dart';
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
  final AuthRepository api = AuthRepository();
  List<Curso> cursosList;
  AuthBloc vueltaBloc;

  @override
  void initState() {
    vueltaBloc = BlocProvider.of<AuthBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (cursosList == null) {
      cursosList = List<Curso>();
    }
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
          ],
          title: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
            height: 40,
            width: 40,
          ),
        ),
        drawer: MainDrawner(),
        body:
            // BlocListener<AuthBloc, AuthState>(
            //   listener: (context, state) {
            //     if (state is UserLoginSuccessState) {
            //       return Navigator.pushNamed(context, '/user');
            //     } else if (state is AdminLoginSuccessState) {
            //       return Navigator.pushNamed(context, '/admin');
            //     } else if (state is ControlPageState) {
            //       return Navigator.pushNamed(context, '/login');
            //     }
            //   },

            FutureBuilder(
          future: loadList(),
          builder: (context, snapshot) {
            return cursosList.length > 0
                ? CursosList(cursos: cursosList)
                : Center(child: Text("No existen Datos, Añade uno"));
          },
        ));
  }

  Future loadList() {
    Future<List<Curso>> futurecase = api.getCursos();
    futurecase.then((cursosList) {
      setState(() {
        this.cursosList = cursosList;
      });
    });
    return loadList();
  }
}
