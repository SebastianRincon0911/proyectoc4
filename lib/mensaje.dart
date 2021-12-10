import 'package:flutter/material.dart';
import 'package:proyectoc4/recibiendoMensaje.dart';

class Mensaje extends StatefulWidget {
  const Mensaje({Key? key}) : super(key: key);

  @override
  State<Mensaje> createState() => _MensajeState();
}

class _MensajeState extends State<Mensaje> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final obj=new RecibiendoMensajes();
    obj.notification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
