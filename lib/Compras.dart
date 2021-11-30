import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectoc4/miCompra.dart';
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
                  toolbarHeight: 48,
                  backgroundColor: Colors.black,
                  title: Text('Compras',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                      )
                  )
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
                                    producto:buscar.text)
                            )
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
    return Column(
      children: [
        Expanded(
          flex: 5,
            child: StreamBuilder<QuerySnapshot>(

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
                      leading: Image.network(data['Logo']),
                      onTap:(){
                        lista.add([data['Producto'],data['Precio']]);
                        print(lista);
                      },
                    ),
                  );
                }
                ).toList()
            );
            },
            )
        ),
        
        Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 20),
                color: Colors.black54,
                height: 100,
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                      label: Text("Agregar al carrito",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black87
                        )
                      ),
                      icon: Icon(Icons.add_shopping_cart,
                      size: 30,
                      color: Colors.black87
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white70,
                          onPrimary: Colors.orange,
                          onSurface: Colors.red,
                          elevation: 10,
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal
                          )
                      ),

                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                ListaCompras(lista: lista,))
                        );
                      },
                ),
            )
        )
      ],
    );
  }
}