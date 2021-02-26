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
        return Container(
          child: ClipRRect(
            child: Container(
              height: 200,
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.only(right: 30),
                            height: 100,
                            width: 125,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                'http://192.168.1.130:3000/imgCurso/${cursos[index].imagen}',
                                fit: BoxFit.cover,
                              ),
                            )
                            // child: Text(votos[index].titulo),
                            ),
                        Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cursos[index].titulo,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 24),
                              ),
                              Text(
                                cursos[index].descripcion,
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        )
                      ],
                    ),

                    // child: Image.network(
                    //     'http://192.168.1.45:3000/imgCurso/${cursos[index].imagen}',
                    //     fit: BoxFit.cover),

                    //   //   child: InkWell(
                    //   // onTap: () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => DetailWidget(cases[index])));
                    // },
                    // child: ListTile(
                    //   leading: Icon(Icons.person),
                    //   title: Text(cursos[index].titulo),

                    //   //  backgroundColor: Colors.grey.withOpacity(0.3),
                    //   subtitle: ClipRRect(
                    //     borderRadius: BorderRadius.circular(10),
                    // child: LinearProgressIndicator(
                    //   value: cases[index].age.toDouble() / 100,
                    //   valueColor: AlwaysStoppedAnimation<Color>(Colors.black38),
                    //   ),
                    // ),
                    // ),
                  ),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 25,
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 10, left: 15),
                        child: Text(cursos[index].titulo2),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 5, top: 5, right: 5, bottom: 5),
                              child: Text('Precio: ${cursos[index].precio}€'),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              padding: EdgeInsets.only(
                                  left: 5, top: 5, right: 5, bottom: 5),
                              child:
                                  Text('Tiempo: ${cursos[index].tiempo} horas'),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
