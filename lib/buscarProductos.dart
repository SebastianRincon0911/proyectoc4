import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectoc4/index.dart';

import 'fondosPantalla.dart';

class buscar extends StatefulWidget {
  const buscar({Key? key}) : super(key: key);

  @override
  _buscarState createState() => _buscarState();
}

class _buscarState extends State<buscar> {

  TextEditingController buscar=TextEditingController();
  String bus='';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        fondoBuscarProductos(),
        Scaffold(
            backgroundColor: Colors.transparent,
            drawer: MenuLateral(),
            appBar: AppBar(
                toolbarHeight: 52,
                backgroundColor: Colors.black45,
                title: Text('Consultar productos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                  )
                )
            ),
            body: SafeArea(
              child: Column(
                children:[

                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: buscar,
                        onChanged: (value){
                          setState(() {});
                        },
                        decoration: InputDecoration(
                           hintText: 'Digite su busqueda',

                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                        child: buscarDato(
                          informacion: buscar.text,
                        )
                    )
                  ]
                )
              )
            )
      ]
    );
  }
}

class buscarDato extends StatelessWidget {
  final String informacion;
  const buscarDato({Key? key, required this.informacion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> consultar=FirebaseFirestore.instance.collection("Negocio").where('Menu' ,arrayContainsAny:[informacion]).snapshots();
    return StreamBuilder<QuerySnapshot> (
      stream: consultar,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){

        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }

        if(informacion.isNotEmpty){
          consultar;
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document){
            Map<String, dynamic> data=document.data()! as Map<String,dynamic>;
            return Container(
              color: Colors.white38,
              margin: EdgeInsets.only(top:5),
              child: ListTile(
                title: Text(data['Nombre'],
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(data['Telefono']+"\n"+data['Direccion']),
                leading: Image.network(data["Logo"]),
              ),
            );
          }
          ).toList()
        );
      },
    );
  }
}

