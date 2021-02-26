import 'package:flutter/material.dart';
//import 'package:flutter_campus/models/alumnos.dart';
import 'package:flutter_campus/models/profesores.dart';
//import 'package:flutter_campus/models/curso.dart';

class ProfeList extends StatelessWidget {
  final List<Profesores> profe;
  ProfeList({Key key, this.profe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: profe == null ? 0 : profe.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            //   child: InkWell(
            // onTap: () {
            //   /*  Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => DetailWidget(cases[index])));
            // */
            //   Navigator.of(context)
            //       .pushNamed('/detalle', arguments: cases[index]);
            // },
            child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: ClipOval(
                    child: profe[index].img == null || profe[index].img == ""
                        ? Image.asset(
                            'assets/images/user.png',
                          )
                        : Image.network(
                            'http://192.168.1.130:3000/img/${profe[index].img}',
                          ),
                  ),
                ),
                title: Text(profe[index].nombre),
                subtitle: Text(profe[index].email),
                trailing: Icon(Icons.keyboard_arrow_right)),
          );
        });
  }
}
