import 'package:flutter/material.dart';
import 'package:flutter_campus/models/curso.dart';

class CursosList extends StatelessWidget {
  final List<Curso> cursos;
  CursosList({Key key, this.cursos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cursos == null ? 0 : cursos.length,
      itemBuilder: (BuildContext context, int index) {
        // return Container(
        //   child: Image.network(
        //       "https://10619-2.s.cdn12.com/r2/bar-counter-Manila_tropical.jpg",
        //       fit: BoxFit.cover),
        // );
        return Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          height: 200,
          width: double.infinity,
          // child: Image.network(
          //     "https://10619-2.s.cdn12.com/r2/bar-counter-Manila_tropical.jpg",
          //     fit: BoxFit.cover),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
          ),

          //   //   child: InkWell(
          //   // onTap: () {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => DetailWidget(cases[index])));
          // },
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text(cursos[index].titulo),

            //  backgroundColor: Colors.grey.withOpacity(0.3),
            subtitle: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              // child: LinearProgressIndicator(
              //   value: cases[index].age.toDouble() / 100,
              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.black38),
            ),
          ),
          // ),
        );
      },
    );
  }
}
