import 'package:flutter/material.dart';

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
                      child: ListTile(
                        title: Text(widget.lista[i]),
                      ),
                    )
                  ],
                );
              },

            ),

          ),
        ],
      ),
    );
  }
}

