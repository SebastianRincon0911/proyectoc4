import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:proyectoc4/buscarNegocio.dart';
import 'package:proyectoc4/buscarNegocioActividad.dart';
import 'package:proyectoc4/geolocalizacion.dart';
import 'package:proyectoc4/index.dart';
import 'package:proyectoc4/listaNegocios.dart';
import 'package:proyectoc4/mensaje.dart';
import 'buscarProductos.dart';
import 'fondosPantalla.dart';
import 'listaNegocios.dart';
import 'Compras.dart';


class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        fondoMenuPrincipal(),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                toolbarHeight: 48,
                backgroundColor: Colors.black,
                title: Text('Menu Principal',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                    )
                )
            ),

            drawer: MenuLateral(),
            body: SafeArea(
              child: Column(
                children:[

                  Container(
                    padding:EdgeInsets.only(right: 118, left: 118, top: 15),
                    alignment: Alignment.center,
                    child: Image.asset('imagenes/mooi.jpg'),
                  ),

                  Container(
                      padding:EdgeInsets.only(right: 30, left: 30, top: 40),
                      alignment: Alignment.topCenter,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(

                          primary: Colors.black54,

                        ),

                          label: Text("Negocios disponibles",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white
                              )
                          ),
                          icon: Icon(
                            Icons.add_business_rounded,
                            size: 20,
                            color: Colors.lightGreen,
                          ),

                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListarNegocios()
                                )
                            );
                          }
                      )
                  ),


                  Container(
                      padding:EdgeInsets.only(right: 30, left: 30, top: 10),
                      alignment: Alignment.topCenter,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(

                            primary: Colors.black54,

                          ),
                          label: Text("Buscar productos",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white
                              )
                          ),
                          icon: Icon(
                            Icons.fastfood_rounded,
                            size: 20,
                            color: Colors.lightGreen,
                          ),

                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => buscar()
                              )
                          );
                        }
                      )
                  ),
                  Container(
                      padding:EdgeInsets.only(right: 30, left: 30, top: 10),
                      alignment: Alignment.topCenter,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(

                            primary: Colors.black54,

                          ),
                          label: Text("Categorias",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white
                              )
                          ),
                          icon: Icon(
                            Icons.clean_hands_rounded,
                            size: 20,
                            color: Colors.lightGreen,
                          ),

                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => buscarNegocioCategoria()
                                )
                            );
                          }
                      )
                  ),

                  Container(
                      padding:EdgeInsets.only(right: 30, left: 30, top: 10),
                      alignment: Alignment.topCenter,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(

                            primary: Colors.black54,

                          ),
                          label: Text("Actividad",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white
                              )
                          ),
                          icon: Icon(
                            Icons.delivery_dining_rounded,
                            size: 20,
                            color: Colors.lightGreen,
                          ),

                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => buscarNegocioActividad()
                                )
                            );
                          }
                      )
                  ),

                  Container(
                      padding:EdgeInsets.only(right: 30, left: 30, top: 10),
                      alignment: Alignment.topCenter,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(

                            primary: Colors.black54,

                          ),
                          label: Text("Compras",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white
                              )
                          ),
                          icon: Icon(
                            Icons.add_shopping_cart_outlined,
                            size: 20,
                            color: Colors.lightGreen,
                          ),

                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Compras()
                                )
                            );
                          }
                      )
                  ),
                ]
            ),
          )
        )
      ]
    );
  }
}