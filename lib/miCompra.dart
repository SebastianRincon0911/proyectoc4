import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  CollectionReference registrarproducto=FirebaseFirestore.instance.collection('Compras');
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
                return Column(
                  children: [

                    Container(
                      margin: EdgeInsets.all(5),
                      child: ListTile(
                        title: Text(widget.lista[i][0]+widget.lista[i][1]),
                        tileColor: Colors.yellow,
                      )
                    ),

                    Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.cyan,
                      margin: EdgeInsets.only(bottom: 50),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Builder(
                            builder:(context){
                              return ElevatedButton.icon(
                                label: Text('Total de la compra',
                                textAlign: TextAlign.center,
                                ),
                                icon: Icon(Icons.eighteen_mp_outlined,
                                size: 29,
                                  color: Colors.green
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.deepOrangeAccent,
                                    onPrimary: Colors.green,
                                  onSurface: Colors.red,
                                  elevation: 10
                                ),

                                onPressed: (){
                                    total=0;
                                    var datonum;
                                    for(int i=0; i<widget.lista.length; i++) {
                                      datonum = int.parse(widget.lista[i][1]);
                                      total = datonum + total;
                                      print(total);
                                    }
                                    Fluttertoast.showToast(msg:'Eltotal de su compa es:'+total.toString(),
                                      fontSize: 20,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.green,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER
                                    );
                                }
                              );
                            }
                          )
                        ]
                      )
                    ),

                    Container(
                      padding: EdgeInsets.all(2),
                      color: Colors.cyan,
                      margin: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.center,
                      child: ElevatedButton.icon(
                          label: Text('Registrar la compra',
                            textAlign: TextAlign.center,
                          ),
                          icon: Icon(Icons.eighteen_mp_outlined,
                              size: 29,
                              color: Colors.green
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrangeAccent,
                              onPrimary: Colors.green,
                              onSurface: Colors.red,
                              elevation: 10
                          ),

                          onPressed: (){
                            List listaregistrar=[];
                            total=0;
                            var datonum;
                            for(int i=0; i<widget.lista.length; i++) {
                              datonum = int.parse(widget.lista[i][1]);
                              total = datonum + total;
                            }
                            for(int i=0; i<widget.lista.length; i++){
                              listaregistrar.add(widget.lista[i][0]);
                            }

                            registrarproducto.doc().set({
                              'producto': listaregistrar,
                              'Total':total,
                            });

                            Fluttertoast.showToast(msg: 'Su compra fue registrada',
                            fontSize:20,
                            backgroundColor: Colors.deepOrangeAccent,
                              textColor: Colors.white,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER
                            );
                          }
                      ),
                    )
                  ]
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}