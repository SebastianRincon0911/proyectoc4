import 'package:flutter/material.dart';
import 'package:proyectoc4/listaNegocios.dart';
import 'package:proyectoc4/registroCliente.dart';
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
          body: SafeArea(
            child: Column(
              children:[


                Image.asset(
                  "imagenes/mooi.jpg",
                  width: 300,
                  height: 150,
                ),

                Container(
                    padding:EdgeInsets.only(right: 30, left: 30, top: 10),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.white.withAlpha(200)
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
                            primary: Colors.red,
                            backgroundColor: Colors.white.withAlpha(200)
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
                Container(
                    padding:EdgeInsets.only(right: 30, left: 30, top: 10),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                            primary: Colors.red,
                            backgroundColor: Colors.white.withAlpha(200)
                        ),

                        child: Text('Buscar negocios por actividad',
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
                Container(
                    padding:EdgeInsets.only(right: 30, left: 30, top: 10),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.white.withAlpha(200)
                        ),

                        child: Text('Compras',
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
                                  builder: (context) => Compras()
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
                            primary: Colors.white,
                            backgroundColor: Colors.white.withAlpha(200)
                        ),

                        child: Text('Registro clientes',
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
                                  builder: (context) => RegistroClientes()
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

