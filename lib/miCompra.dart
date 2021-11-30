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
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(3),
                      padding: EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(widget.lista[i][0]+"  "+ widget.lista[i][1],
                        style: TextStyle(
                          color: Colors.white,

                        ),
                        ),
                        tileColor: Colors.black54,

                      ),
                    ),
                  ],
                );
              },

            ),

          ),
          Container(
              padding: EdgeInsets.all(2),
              color: Colors.black26,
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
                              primary: Colors.white70,
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
                              backgroundColor: Colors.blue,
                              textColor: Colors.black,
                              toastLength: Toast.LENGTH_SHORT,

                            );
                          },
                        );

                      }
                  )
                ],
              )
          ),
          Container(
            padding: EdgeInsets.all(2),
            color: Colors.black26,
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              label: Text("Registrar su compra",
                textAlign: TextAlign.center,),
              icon: Icon(Icons.checklist,
                size: 20,
                color: Colors.black87,
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
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
                  "Total": total
                });
                Fluttertoast.showToast(msg: "Su compra fue registrada",
                  fontSize: 20,
                  backgroundColor: Colors.blue,
                  textColor: Colors.black,
                  toastLength: Toast.LENGTH_SHORT,
                );
              },

            ),
          )

        ],
      ),
    );
  }
}

