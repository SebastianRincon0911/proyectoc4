import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Productos"),
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
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                label: Text("Registrar",textAlign: TextAlign.center,
                ),
                icon: Icon(
                  Icons.ac_unit,
                  size: 20,
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
              padding: EdgeInsets.all(2),
              alignment: Alignment.center,
              child: ElevatedButton.icon(

                label: Text("Actualizar",
                  textAlign: TextAlign.center,
                ),
                icon: Icon(
                  Icons.ac_unit,
                  size: 20,
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
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                label: Text("Eliminar",
                  textAlign: TextAlign.center,
                ),
                icon: Icon(
                  Icons.ac_unit,
                  size: 20,
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
    );
  }
}

