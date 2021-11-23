import 'package:flutter/material.dart';
import 'package:proyectoc4/listaNegocios.dart';

import 'package:url_launcher/url_launcher.dart';



class DescripcionNegocio extends StatefulWidget {
  final Negocio negocio;
  const DescripcionNegocio(this.negocio,{Key? key}) : super(key: key);

  @override
  _DescripcionState createState() => _DescripcionState();
}

class _DescripcionState extends State<DescripcionNegocio> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.negocio.nombre),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          height: 400,
          child: Card(
            elevation: 10,
            shadowColor: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            color: Color.fromARGB(100, 200, 21, 50),
            child: Center(
              child: Column(
                children: [
                  //Image.network(widget.negocio.imagen,width: 100,),
                  //Image.asset("img/ico.png",width: 100,),
                  //Text(widget.cliente.imagen),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      label: Text("Ir a la web",textAlign: TextAlign.center,),
                      icon: Icon(Icons.import_contacts_sharp),
                      onPressed: ()async{
                        if(await canLaunch(widget.negocio.web)){
                          await launch(widget.negocio.web);
                        }
                        else{
                          throw "No se pudo iniciar";
                        }
                      },

                    ),
                  )
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
