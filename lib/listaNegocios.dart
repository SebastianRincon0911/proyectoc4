import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Nueva extends StatelessWidget {
  const Nueva({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(
            title: Text('App tiendas'),
          ),
          body: ConsultarNegocios()
          ),
        );
  }
}


class ConsultarNegocios extends StatefulWidget {
  const ConsultarNegocios({Key? key}) : super(key: key);

  @override
  _ConsultarNegociosState createState() => _ConsultarNegociosState();
}

class _ConsultarNegociosState extends State<ConsultarNegocios> {
  final Stream<QuerySnapshot> consulta=FirebaseFirestore.instance.collection('ListaNegocios').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: consulta,
        builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Existe error');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Cargando..");
          }

          return ListView(
            children: snapshot.data!.docs.map(
                    (DocumentSnapshot document){
                  Map<String, dynamic> data = document.data()! as Map<String,dynamic>;
                  return Container(
                      color: Colors.black12,
                      margin: EdgeInsets.only(top: 5),
                      child: ListTile(
                        title: Text(data['Nombre'],
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(data['Direccion']+"\n"+data['Nit'],
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),

                      )
                  );
                }
            ).toList(),
          );
        }
    );
  }
}


