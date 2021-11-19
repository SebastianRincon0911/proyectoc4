import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'fondosPantalla.dart';
import 'menuPrincipal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pantalla()
    );
  }
}

class Pantalla extends StatefulWidget {
    @override
    State<Pantalla> createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {
    final usuario = TextEditingController();
    final password = TextEditingController();
    String usu = '';
    String pas = '';

  @override
  Widget build(BuildContext context){
    return Stack(
      children:[
        fondoLogin(),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [

                  Container(
                    padding:EdgeInsets.only(right: 140, left: 140, top: 25),
                    alignment: Alignment.center,
                    child: Image.asset('imagenes/mooi.jpg'),
                  ),

                  Container(
                      height: 38,
                      child: Center(
                          child: Text('Mooi products',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                              ),
                          )
                      )
                  ),

                  Container(
                      padding:EdgeInsets.only(right: 40, left: 40, top: 35),
                      child: TextField(
                          controller: usuario,
                          decoration: InputDecoration(
                              hintText: 'Usuario/Correo',
                            ),
                            style: TextStyle(
                              color: Colors.black
                          )
                      )
                  ),

                  Container(
                      padding:EdgeInsets.only(right: 40, left: 40, top: 35),
                      child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                              hintText: 'Contraseña'
                          ),
                          style: TextStyle(
                              color: Colors.black
                          )
                      )
                  ),

                  Container(
                      padding:EdgeInsets.only(right: 40, left: 40, top: 35),
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          primary: Colors.red,
                        ),

                        child: Text('Ingresar',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black
                            ),
                          ),

                          onPressed: () {
                              usu = usuario.text;
                              pas = password.text;
                              if (usu == "pepe" && pas == "123") {
                                  print("Bienvenido " + usu);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                         builder: (context) => MenuPrincipal()),
                                  );
                              }
                          },
                      )
                  )
              ]
              )
            ),
        )
      ]
    );
  }
}


