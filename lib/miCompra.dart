import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyectoc4/listaNegocios.dart';

class MiCompra extends StatelessWidget {
  const MiCompra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mi compra"),
        ),
      ),
    );
  }
}

class ListaCompras extends StatefulWidget {
  List lista=[];

  ListaCompras({required this.lista});

  @override
  _ListaComprasState createState() => _ListaComprasState();
}

class _ListaComprasState extends State<ListaCompras> {
  var total;
  CollectionReference registrarproducto = FirebaseFirestore.instance.collection("Compras");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sus compras"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.lista.length,
              itemBuilder: (BuildContext context,i){
                final item = widget.lista[i][0];
                return Dismissible(

                  onDismissed: (_){
                    widget.lista.removeAt(i);
                  },
                  key: Key(item),
                  movementDuration: Duration(milliseconds: 100),

                  child: ListTile(
                    title: Text(widget.lista[i][0]+"  "+ widget.lista[i][1],
                      style: TextStyle(
                        color: Colors.white,

                        ),
                        ),
                        tileColor: Colors.black54,
                  ),
                  background: Container(
                    color: Colors.blue,
                    alignment: Alignment.centerLeft,

                    child: Text("Eliminar",style: TextStyle(
                      fontSize: 20
                    ),),
                  ),

                );
              },

            ),

          ),
          Container(
              padding: EdgeInsets.all(2),
              color: Colors.transparent,
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Builder(
                      builder: (context){
                        return ElevatedButton.icon(
                          label: Text("Consultar Total de la compra",
                            textAlign: TextAlign.center,),
                          icon: Icon(Icons.attach_money,
                            size: 20,
                            color: Colors.black87,
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black87,
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
                          onPressed: (){
                            total = 0;
                            var num;
                            var datonum;
                            for( int i=0; i<widget.lista.length; i++){
                              num = widget.lista[i][1];
                              datonum = int.parse(num);
                              total = datonum+total;
                              print(total);
                            }
                            Fluttertoast.showToast(msg: "El total de su compra es "+ total.toString(),
                              fontSize: 20,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              toastLength: Toast.LENGTH_SHORT,

                            );
                          },
                        );

                      }
                  )
                ],
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(2),
                color: Colors.transparent,
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  label: Text("Domicilio",
                    textAlign: TextAlign.center,),
                  icon: Icon(Icons.checklist,
                    size: 20,
                    color: Colors.black87,
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black87,
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
                  onPressed: (){
                    List listaregistrar=[];
                    total=0;
                    var datonum;
                    for( int i=0; i<widget.lista.length; i++){
                      datonum = int.parse(widget.lista[i][1]);
                      total=datonum+total;
                    }
                    for( int i=0; i<widget.lista.length; i++){
                      listaregistrar.add(widget.lista[i][0]);
                    }

                    registrarproducto.doc().set({
                      "Producto":listaregistrar,
                      "Total": total,
                      "Tipo de Orden": "Domicilio"
                    });
                    Fluttertoast.showToast(msg: "Su compra fue registrada",
                      fontSize: 20,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      toastLength: Toast.LENGTH_SHORT,
                    );
                  },

                ),
              ),
              Container(
                padding: EdgeInsets.all(2),
                color: Colors.transparent,
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  label: Text("Recoje",
                    textAlign: TextAlign.center,),
                  icon: Icon(Icons.checklist,
                    size: 20,
                    color: Colors.black87,
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black87,
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
                  onPressed: (){
                    List listaregistrar=[];
                    total=0;
                    var datonum;
                    for( int i=0; i<widget.lista.length; i++){
                      datonum = int.parse(widget.lista[i][1]);
                      total=datonum+total;
                    }
                    for( int i=0; i<widget.lista.length; i++){
                      listaregistrar.add(widget.lista[i][0]);
                    }

                    registrarproducto.doc().set({
                      "Producto":listaregistrar,
                      "Total": total,
                      "Tipo de Orden": "Recoje en tienda"
                    });
                    Fluttertoast.showToast(msg: "Su compra fue registrada",
                      fontSize: 20,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      toastLength: Toast.LENGTH_SHORT,
                    );
                  },

                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}

