import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_campus/bloc/auth_bloc.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  AuthBloc authBloc;
  final _addFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(ComprobarPaginas());
    super.initState();
  }

  Widget build(BuildContext context) {
    final logo = Container(
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        border: 
      ),
      // child: Icon(
      //   Icons.account_circle_rounded,
      //   size: 150,
      //   color: Colors.blue,
      // ),
    );

    final msg = BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is LoginErrorState) {
        return Text(state.message);
      } else if (state is LoginLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container();
      }
    });

    final username = TextFormField(
      style: TextStyle(color: Colors.white60),
      controller: email,
      validator: (value) {
        if (value.isEmpty) {
          return 'introduce correo';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email, color: Colors.black45),
        // filled: true,
        // fillColor: Colors.blue,
        hintStyle: TextStyle(color: Colors.white70),
        hintText: 'Email',

        // contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20),
        // ),
      ),
    );

    final pass = TextFormField(
      style: TextStyle(color: Colors.white60),
      controller: password,
      validator: (value) {
        if (value.isEmpty) {
          return 'introduce password';
        }
        return null;
      },
      keyboardType: TextInputType.text,
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Colors.black45),
        // filled: true,
        // fillColor: Colors.blue,
        hintStyle: TextStyle(color: Colors.white70),
        hintText: 'Password',
        // contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20),
        // ),
      ),
    );

    final loginbutton = Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          if (_addFormKey.currentState.validate()) {
            _addFormKey.currentState.save();
            authBloc.add(
              LoginButtonPress(email: email.text, password: password.text),
            );
          }
        },
        padding: EdgeInsets.all(10),
        color: Colors.lightBlue,
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );

    //*** scaffoll
    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UserLoginSuccessState) {
          return Navigator.pushNamed(context, '/user');
        } else if (state is AdminLoginSuccessState) {
          return Navigator.pushNamed(context, '/admin');
        }
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.blue[500],
              Colors.white60,
            ])),
        child: Center(
          child: Form(
            key: _addFormKey,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                logo,
                SizedBox(height: 20.0),
                msg,
                SizedBox(height: 48.0),
                username,
                SizedBox(height: 20.0),
                pass,
                SizedBox(height: 48.0),
                loginbutton,
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
