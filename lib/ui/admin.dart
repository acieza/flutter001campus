import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_campus/bloc/auth_bloc.dart';
////import 'package:flutter_campus/models/alumnos.dart';
import 'package:flutter_campus/models/curso.dart';
import 'package:flutter_campus/repository/auth_repo.dart';
//import 'package:flutter_campus/ui/alumlist.dart';

import 'cursoslist.dart';
import 'drawer_admin.dart';
//import 'main_drawer.dart';

// class AddContact extends StatelessWidget {
//   const AddContact({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text("Eres un Administador"),
//       ),
//     );
//   }
// }
class Admin extends StatefulWidget {
  Admin({Key key}) : super(key: key);

  @override
  _Admin createState() => _Admin();
}

class _Admin extends State<Admin> {
  final AuthRepository api = AuthRepository();
  List<Curso> cursosList;
  //AuthBloc vueltaBloc;

  @override
  void initState() {
    // vueltaBloc = BlocProvider.of<AuthBloc>(context);

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
            height: 40,
            width: 40,
          ),
        ),
        drawer: DrawnerAdmin(),
        backgroundColor: Colors.white,
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
