import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proyectoc4/registroCliente.dart';
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
                    padding:EdgeInsets.only(right: 140, left: 140, top: 0),
                    alignment: Alignment.center,
                    child: Image.asset('imagenes/mooi.jpg'),
                  ),

                  Container(
                      height: 60,
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
                              hintText: 'Contrase??a'
                          ),
                          style: TextStyle(
                              color: Colors.black
                          )
                      )
                  ),

                  Container(
                      padding:EdgeInsets.only(right: 40, left: 40, top: 30),
                      alignment: Alignment.center,
                      child: RaisedButton.icon(
                        color: Colors.black87,
                        label: Text("Ingresar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white
                            )
                        ),
                        icon: Icon(
                          Icons.assignment_ind,
                          size: 20,
                          color: Colors.lightGreen,
                        ),

                          onPressed: () {
                              usu = usuario.text;
                              pas = password.text;
                              if (usu == "Pepe" && pas == "123") {
                                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                         builder: (context) => MenuPrincipal()),
                                  );
                              }
                          },
                      )
                  ),

                  Container(
                      padding:EdgeInsets.only(right: 30, left: 30, top: 10),
                      alignment: Alignment.center,
                      child: RaisedButton.icon(
                          color: Colors.black87,
                          label: Text("Registrarse",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white
                              )
                          ),
                          icon: Icon(
                            Icons.fact_check,
                            size: 20,
                            color: Colors.lightGreen,
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
              )
            ),
        )
      ]
    );
  }
}


