import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:proyectoc4/buscarNegocio.dart';
import 'package:proyectoc4/buscarNegocioActividad.dart';
import 'package:proyectoc4/listaNegocios.dart';
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

            drawer: Drawer(
                child: ListView(
                    children: [
                      UserAccountsDrawerHeader(
                          accountName: Text("Mooi Products",
                              style: TextStyle(
                                color: Colors.white)),
                          accountEmail: Text('Bienvenido!!!',
                              style: TextStyle(
                                  color: Colors.white)),
                          currentAccountPicture: Image.asset('imagenes/mooi.jpg'),
                          decoration: BoxDecoration(
                            color: Colors.black87
                          )
                      ),

                      Container(
                          color: Colors.black26,
                          margin: EdgeInsets.all(3),
                          child: ListTile(
                              title: Text("Buscar",
                                style: TextStyle(
                                    color: Colors.black
                                ),
                              ),
                              leading: Image.asset('imagenes/buscar3.jpg'),
                              onTap: (){
                                Navigator.of(context).pop();
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> Compras()),
                                );
                              }
                          )
                      ),

                      Container(
                          color: Colors.black26,
                          margin: EdgeInsets.all(3),
                          child: ListTile(
                              title: Text("Negocios",
                                style: TextStyle(
                                    color: Colors.black
                                ),
                              ),
                              leading: Image.asset('imagenes/negocios1.jpg'),
                              onTap: (){
                                Navigator.of(context).pop();
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> Compras()),
                                );
                              }
                          )
                      ),

                      Container(
                          color: Colors.black26,
                          margin: EdgeInsets.all(3),
                          child: ListTile(
                              title: Text("Compras",
                                style: TextStyle(
                                    color: Colors.black
                                ),
                              ),
                              leading: Image.asset('imagenes/compras1.jpg'),
                              onTap: (){
                                Navigator.of(context).pop();
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> Compras()),
                                );
                              }
                          )
                      ),

                      Container(
                          color: Colors.black26,
                          margin: EdgeInsets.all(3),
                          child: ListTile(
                              title: Text("Categorias",
                                style: TextStyle(
                                    color: Colors.black
                                ),
                              ),
                              leading: Image.asset('imagenes/categorias.jpg'),
                              onTap: (){
                                  Navigator.of(context).pop();
                                  Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> Compras()),
                                  );
                              }
                          )
                      ),

                      Container(
                          color: Colors.black26,
                          margin: EdgeInsets.all(3),
                          child: ListTile(
                              title: Text("Actividad",
                              style: TextStyle(
                                color: Colors.black
                              ),
                              ),
                              leading: Image.asset('imagenes/actividad1.jpg'),
                              onTap: (){
                                Navigator.of(context).pop();
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> Compras()),
                                );
                              }
                          )
                      ),
                    ]
                )
            ),

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
                      child: RaisedButton.icon(
                          color: Colors.black54,
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
                      child: RaisedButton.icon(
                          color: Colors.black54,
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
                      child: RaisedButton.icon(
                          color: Colors.black54,
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
                      child: RaisedButton.icon(
                          color: Colors.black54,
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
                      child: RaisedButton.icon(
                          color: Colors.black54,
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