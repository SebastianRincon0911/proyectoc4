import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyectoc4/Compras.dart';
import 'package:proyectoc4/buscarNegocio.dart';
import 'package:proyectoc4/buscarNegocioActividad.dart';
import 'package:proyectoc4/buscarProductos.dart';
import 'package:proyectoc4/listaNegocios.dart';
import 'package:proyectoc4/menuPrincipal.dart';
import 'appLogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter LoginPage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Pantalla(),
    );
  }
}


class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                          MaterialPageRoute(builder: (context)=> buscar()),
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
                          MaterialPageRoute(builder: (context)=> ListarNegocios()),
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
                          MaterialPageRoute(builder: (context)=> buscarNegocioCategoria()),
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
                          MaterialPageRoute(builder: (context)=> buscarNegocioActividad()),
                        );
                      }
                  )
              ),
            ]
        )
    );
  }
}
