// import 'package:botonmenulateral/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_campus/bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawnerAdmin extends StatefulWidget {
  const DrawnerAdmin({Key key}) : super(key: key);

  @override
  _DrawnerAdminState createState() => _DrawnerAdminState();
}

class _DrawnerAdminState extends State<DrawnerAdmin> {
  AuthBloc vueltaBloc;

  @override
  void initState() {
    vueltaBloc = BlocProvider.of<AuthBloc>(context);
    var pref = SharedPreferences.getInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://images.pexels.com/photos/217114/pexels-photo-217114.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    //      vueltaBloc.add(NombreUserToken();),
                    "Alejandro",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    'asanjuancieza@gmal.com',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle_sharp),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text(
              'Cursos',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/admin');
            },
          ),
          ListTile(
            leading: Icon(Icons.school_outlined),
            title: Text(
              'Alumnos',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/alum');
            },
          ),
          ListTile(
            leading: Icon(Icons.school_sharp),
            title: Text(
              'Profesores',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/profe');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              vueltaBloc.add(EliminarToken());
              return Navigator.pushNamed(context, "/login");
            },
          )
        ],
      ),
    );
  }
}
