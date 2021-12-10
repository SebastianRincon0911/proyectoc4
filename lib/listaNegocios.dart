import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectoc4/DescripcionNegocio.dart';
import 'package:proyectoc4/index.dart';
import 'fondosPantalla.dart';


class ListarNegocios extends StatelessWidget {
  const ListarNegocios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          fondoRegistro(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.black87,
              toolbarHeight: 48,
              title: Text("Negocios Disponibles",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            drawer: MenuLateral(),
            body: ConsultaClientes(),
          ),
        ]
    );
  }
}

class ConsultaClientes extends StatefulWidget {

  @override
  _ConsultaClientes createState() => _ConsultaClientes();
}

class _ConsultaClientes extends State<ConsultaClientes> {
  //LISTA TODA LA TABLA PRODUCTOS
  final Stream<QuerySnapshot> consulta = FirebaseFirestore.instance.collection("Negocio").snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: consulta,
      builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Existe error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Cargando");
        }

        return ListView(

            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

              return Container(
                  color: Colors.white70,
                  margin: EdgeInsets.only(top: 5),
                  child: ListTile(
                    title: Text(data["Nombre"]),
                    subtitle: Text(data["Direccion"]),
                    leading: Image.network(data['Logo'],width: 100,),
                    onTap: (){
                      Negocio neg = Negocio(data["Foto"],data["Nombre"], data["Direccion"],
                          data["Geolocalizacion"], data["Celular"], data["Telefono"], data["Web"],data["Actividad"],data["Categoria"]);
                      Navigator.push(context,
                          MaterialPageRoute(
                          builder: (context) => DescripcionNegocio(neg)
                          )
                      );
                    },
                  )
              );
            }
            ).toList()
        );
      },
    );
  }
}


class Negocio{
  String foto="";
  String nombre="";
  String direccion="";
  String geolocalizacion="";
  String celular="";
  String telefono="";
  String web="";
  String actividad="";
  String categoria="";

  Negocio(this.foto, this.nombre, this.direccion, this.geolocalizacion,
      this.celular, this.telefono, this.web, this.actividad, this.categoria);
}