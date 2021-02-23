import 'package:flutter/gestures.dart';
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
      style: TextStyle(color: Colors.grey),
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
        prefixIcon: Icon(Icons.email, color: Colors.blue),
        // filled: true,
        // fillColor: Colors.blue,
        hintStyle: TextStyle(color: Colors.grey),
        hintText: 'Email',

        // contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20),
        // ),
      ),
    );

    final pass = TextFormField(
      style: TextStyle(color: Colors.black),
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
        prefixIcon: Icon(Icons.lock, color: Colors.blue),
        // filled: true,
        // fillColor: Colors.blue,
        hintStyle: TextStyle(color: Colors.grey),
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
        resizeToAvoidBottomPadding: false,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is UserLoginSuccessState) {
              return Navigator.pushNamed(context, '/user');
            } else if (state is AdminLoginSuccessState) {
              return Navigator.pushNamed(context, '/admin');
            }
          },
          child: Container(
            padding: EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.blue[500],
                          Colors.white60,
                        ]),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(200),
                        bottomRight: Radius.circular(200)),
                  ),
                  child: Center(
                    child: Image.asset("assets/images/logo.png",
                        height: 80, width: 80, fit: BoxFit.fill),
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    children: [
                      Center(
                        child: Form(
                          key: _addFormKey,
                          child: ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(left: 24.0, right: 24.0),
                            children: <Widget>[
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
                      )
                    ],
                  ),
                )),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Aún no tienes Cuenta ? ",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: "Regístrate",
                          style: TextStyle(color: Colors.blue),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/regipage');
                            }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
