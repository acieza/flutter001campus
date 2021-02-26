import 'package:flutter_campus/models/alumnos.dart';
import 'package:flutter_campus/models/curso.dart';
import 'package:flutter_campus/models/profesores.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepository {
  login(String email, String password) async {
    var res = await http.post("http://192.168.1.130:3000/login",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        },
        body: jsonEncode({"email": email, "password": password}));
    final data = json.decode(res.body);

    if (data['ok'] == true) {
      print('bien');
      print(data);
      return data;
    } else {
      print('mal');
      print(data);
      return "tenemos un fallo en la Api";
    }
  }

  registro(String email, String password, String nombre) async {
    Map datos = {"nombre": nombre, "email": email, "password": password};

    final http.Response res = await http.post(
        "http://192.168.1.130:3000/usuarios",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        },
        body: jsonEncode(datos));
    final data = json.decode(res.body);

    if (data['ok'] == true) {
      print('Usuario Guardado con éxito');
      print(data);
      return data;
    } else {
      print('mal');
      print(data);
      return "tenemos un fallo en la Api";
    }
  }

  Future<List<Curso>> getCursos() async {
    http.Response res = await http.get("http://192.168.1.130:3000/cursos");

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Curso> cursos =
          body.map((dynamic item) => Curso.fromJson(item)).toList();
      return cursos;
    } else {
      throw "Error en la lista de Casos";
    }
  }

  Future<List<Alumnos>> getAlum() async {
    http.Response res =
        await http.get("http://192.168.1.130:3000/usuarios/user");

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Alumnos> alum =
          body.map((dynamic item) => Alumnos.fromJson(item)).toList();
      return alum;
    } else {
      throw "Error en la lista de Alumnos";
    }
  }

  Future<List<Profesores>> getProf() async {
    http.Response res =
        await http.get("http://192.168.1.130:3000/usuarios/profesor");

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Profesores> prof =
          body.map((dynamic item) => Profesores.fromJson(item)).toList();
      return prof;
    } else {
      throw "Error en la lista de Profesores";
    }
  }
  // getCursos() async {
  //   var response = await http.get("http://192.168.1.130:3000/usuarios");
  // }
}
