import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_campus/bloc/auth_bloc.dart';
import 'package:flutter_campus/repository/auth_repo.dart';
import 'package:flutter_campus/ui/admin.dart';
import 'package:flutter_campus/ui/regi-page.dart';
import 'package:flutter_campus/ui/splash_page.dart';
import 'package:flutter_campus/ui/user.dart';
import 'package:flutter_campus/ui/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc(AuthInitial(), AuthRepository())),
      ],
      child: MaterialApp(
        home: SplashPage(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/login': (context) => Login(),
          '/splash_page': (context) => SplashPage(),
          '/user': (context) => User(),
          '/admin': (context) => Admin(),
          '/regipage': (context) => RegiPage(),
        },
      ),
    );
  }
}
