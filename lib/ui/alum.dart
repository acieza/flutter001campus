import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_campus/bloc/auth_bloc.dart';
import 'package:flutter_campus/models/alumnos.dart';
//import 'package:flutter_campus/models/alumnos.dart';
//import 'package:flutter_campus/models/profesores.dart';
import 'package:flutter_campus/repository/auth_repo.dart';
//import 'package:flutter_campus/ui/alumlist.dart';
//import 'package:flutter_campus/ui/profelist.dart';

import 'alumlist.dart';
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
class Alum extends StatefulWidget {
  Alum({Key key}) : super(key: key);

  @override
  _Alum createState() => _Alum();
}

class _Alum extends State<Alum> {
  final AuthRepository api = AuthRepository();
  List<Alumnos> alumnoList;

  // AuthBloc vueltaBloc;

  @override
  void initState() {
    // vueltaBloc = BlocProvider.of<AuthBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (alumnoList == null) {
      alumnoList = List<Alumnos>();
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
        backgroundColor: Colors.white60,
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
            return alumnoList.length > 0
                ? AlumList(alum: alumnoList)
                : Center(child: Text("No existen Datos, Añade uno"));
          },
        ));
  }

  Future loadList() {
    Future<List<Alumnos>> futurealum = api.getAlum();
    futurealum.then((alumnoList) {
      setState(() {
        this.alumnoList = alumnoList;
      });
    });
    return loadList();
  }
}
