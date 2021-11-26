import 'package:flutter/material.dart';
import 'package:proyectoc4/fondosPantalla.dart';
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
    return Stack(
        children:[
          fondoNegociosWeb(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 52,
              backgroundColor: Colors.black87,
              title: Text(widget.negocio.nombre,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              height: 500,
              child: Card(
                color: Colors.black54,
                elevation: 10,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                      ),
                      Image.network(widget.negocio.foto,width: 330),
                      //Image.asset("img/ico.png",width: 100,),
                      //Text(widget.cliente.imagen),

                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Text("Direccion: "+widget.negocio.direccion
                            + "\n" +"Telefono: "+widget.negocio.telefono
                            + "\n" +"Celular: "+widget.negocio.celular
                            + "\n" +"Categoria: "+widget.negocio.categoria
                            + "\n" +"Actividad: "+widget.negocio.actividad,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),),
                      ),


                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: RaisedButton.icon(
                          color: Colors.white,
                          label: Text("Pagina Web",textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black87,
                              )
                          ),
                          icon: Icon(Icons.import_contacts_sharp,
                              color: Colors.black87),
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
        ]
    );
  }
}
