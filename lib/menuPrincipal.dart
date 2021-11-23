import 'package:flutter/material.dart';
import 'package:proyectoc4/listaNegocios.dart';
import 'buscarProductos.dart';
import 'fondosPantalla.dart';
import 'listaNegocios.dart';


class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        fondoMenuPrincipal(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children:[

                Container(
                  height: 150,
                  child: Center(
                    child: Text("Menu principal",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          color: Colors.black87,
                          decoration: TextDecoration.overline,
                          decorationColor: Colors.black,
                          decorationStyle: TextDecorationStyle.double,
                      )
                    )
                  ),
                ),

                Container(
                    padding:EdgeInsets.only(right: 30, left: 30, top: 10),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        primary: Colors.red
                      ),

                      child: Text('Buscar productos',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.black
                        )
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
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                            primary: Colors.red
                        ),

                        child: Text('Negocios registrados en la App',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Colors.black
                            )
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


              ]
            ),
          )
        )
      ]
    );
  }
}

