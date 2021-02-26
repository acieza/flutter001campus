import 'package:flutter/material.dart';
import 'package:flutter_campus/models/alumnos.dart';
//import 'package:flutter_campus/models/curso.dart';

class AlumList extends StatelessWidget {
  final List<Alumnos> alum;
  AlumList({Key key, this.alum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: alum == null ? 0 : alum.length,
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
                      child: //((){
                          //if (alum[index].img){
                          alum[index].img == null || alum[index].img == ""
                              ? Image.asset(
                                  'assets/images/user.png',
                                )
                              : Image.network(
                                  'http://192.168.1.130:3000/img/${alum[index].img}',
                                ),
                      //  }}()),
                    )),
                title: Text(alum[index].nombre),
                subtitle: Text(alum[index].email),
                trailing: Icon(Icons.keyboard_arrow_right)),
          );
        });
  }
}
