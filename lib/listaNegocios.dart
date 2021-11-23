import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:proyectoc4/DescripcionNegocio.dart';


class ListarNegocios extends StatelessWidget {
  const ListarNegocios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Tiendas"),
        ),
        body: ConsultaClientes(),


      ),
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
                  color: Colors.yellow,
                  margin: EdgeInsets.only(top: 5),
                  child: ListTile(
                    title: Text(data["Nombre"]),
                    subtitle: Text(data["Telefono"]),
                    onTap: (){
                      Negocio neg = Negocio(data["Actividad"], data["Categoria"], data["Codigo"], data["Direccion"], data["Geolocalizacion"], data["Nombre"], data["Telefono"], data["Web"]);
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => DescripcionNegocio(neg) ));
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
  String actividad="";
  String categoria="";
  String codigo="";
  String direccion="";
  String geolocalizacion="";
  String nombre="";
  String telefono="";
  String web="";

  Negocio(this.actividad, this.categoria, this.codigo, this.direccion,
      this.geolocalizacion, this.nombre, this.telefono, this.web);

}