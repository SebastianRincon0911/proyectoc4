import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'fondosPantalla.dart';

class Compras extends StatefulWidget {
  const Compras({Key? key}) : super(key: key);

  @override
  _ComprasState createState() => _ComprasState();

}
class _ComprasState extends State<Compras> {
  TextEditingController buscar=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Comprasfondo(),
    Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
          ),
body:Center(
  child: SizedBox(
width: 350,
    child:Column(
      children: [

        Container(
          padding:EdgeInsets.all(5),
          child: TextField(
            controller: buscar,
            onChanged: (value){
              setState(() {

              }
              );
            },
            decoration: InputDecoration(
              hintText: 'Digite el negocio'
            )
          )
        ),
        Expanded(
            child: BuscarProducto(
                producto:buscar.text))
      ],
    ),
  ),
)
      ),
        ],
    );

  }
}

class BuscarProducto extends StatelessWidget{
  final String producto;
  final List lista=[];

 BuscarProducto({Key? key, required this.producto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot>consultar=FirebaseFirestore.instance.collection("Producto").where("Negocio",isEqualTo:producto).snapshots();
    return StreamBuilder<QuerySnapshot>(

      stream: consultar,
      builder:(context,AsyncSnapshot<QuerySnapshot>snapshot){
  if(!snapshot.hasData){
    return Center(child:CircularProgressIndicator(),);
  }
  return ListView(
      children: snapshot.data!.docs.map((DocumentSnapshot document){
        Map<String, dynamic> data=document.data()! as Map<String,dynamic>;
        return Container(
          color: Colors.white,
          margin: EdgeInsets.only(top:5),
          child: ListTile(
            title: Text(data['Producto']),
              subtitle: Text(data['Precio']),
            onTap:(){
          lista.add(data['Producto']);
          lista.add(data['Precio']);
          print(lista);
          },
            ),


        );

      }
      ).toList()
  );


      },

    );
  }
}
