import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'fondosPantalla.dart';

class RegistroClientes extends StatefulWidget {
  const RegistroClientes({Key? key}) : super(key: key);

  @override
  _RegistroClientesState createState() => _RegistroClientesState();
}

class _RegistroClientesState extends State<RegistroClientes> {
  final codigo = TextEditingController();
  final telefono = TextEditingController();
  final nombre = TextEditingController();
  final celular = TextEditingController();
  final direccion = TextEditingController();
  CollectionReference pro = FirebaseFirestore.instance.collection("clientes");
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
                    title: Text("Registro",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                    ),
                ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: codigo,
                decoration: InputDecoration(
                    hintText: "Codigo del cliente"
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nombre,
                decoration: InputDecoration(
                    hintText: "Nombre del cliente"
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: celular,
                decoration: InputDecoration(
                    hintText: "Celular del cliente"
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: telefono,
                decoration: InputDecoration(
                    hintText: "Telefono del cliente"
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: direccion,
                decoration: InputDecoration(
                    hintText: "Direccion del cliente"
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(top:50),
              alignment: Alignment.center,
              child: RaisedButton.icon(
                color: Colors.black54,
                label: Text("Registrar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                icon: Icon(
                  Icons.add_box,
                  size: 20,
                  color: Colors.lightGreen,
                ),

                onPressed: (){
                  if(codigo.text.isEmpty|| nombre.text.isEmpty || telefono.text.isEmpty||celular.text.isEmpty||direccion.text.isEmpty){
                    Fluttertoast.showToast(msg: "Ingresar todos los datos",toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.CENTER);

                  }
                  else{
                    pro.doc(codigo.text).set(
                        {
                          "Nombre":nombre.text,
                          "Telefono":telefono.text,
                          "Celular":celular.text,
                          "Direccion":direccion.text,

                        });
                    Fluttertoast.showToast(msg: "Datos guardados",
                        fontSize: 20,
                        backgroundColor: Colors.lightBlue,
                        textColor: Colors.black,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM);

                  }
                },
              ),
            ),

            Container(
              padding: EdgeInsets.only(top:20),
              alignment: Alignment.center,
              child: RaisedButton.icon(
                color: Colors.black54,
                label: Text("Actualizar",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white
                    )
                ),
                icon: Icon(
                  Icons.find_replace,
                  size: 20,
                  color: Colors.lightGreen,
                ),

                onPressed: (){

                  pro.doc(codigo.text).update(
                      {
                        "Nombre":nombre.text,
                        "Telefono":telefono.text,
                        "Celular":celular.text,
                        "Direccion":direccion.text,

                      });
                  Fluttertoast.showToast(msg: "Datos guardados",
                      fontSize: 20,
                      backgroundColor: Colors.lightBlue,
                      textColor: Colors.black,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM);


                },
              ),
            ),

            Container(
              padding: EdgeInsets.only(top:20),
              alignment: Alignment.center,
              child: RaisedButton.icon(
                color: Colors.black54,
                label: Text("Eliminar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                icon: Icon(
                  Icons.auto_delete,
                  size: 20,
                  color: Colors.lightGreen,
                ),

                onPressed: (){

                  pro.doc(codigo.text).delete();
                  Fluttertoast.showToast(msg: "Datos guardados",
                      fontSize: 20,
                      backgroundColor: Colors.lightBlue,
                      textColor: Colors.black,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM);


                },
              ),
            ),

          ],
        ),
      ),
    ]
    );
  }
}

