import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class fondoLogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: [Colors.black26, Colors.black26],
        ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('imagenes/platoFrio.jpg'),
                  fit: BoxFit.cover,

                )
            )
        )
    );
  }
}

class fondoMenuPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) =>
            LinearGradient(
              colors: [Colors.black26, Colors.black26],
            ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('imagenes/fondo2.jpg'),
                  fit: BoxFit.cover,
                )
            )
        )
    );
  }
}

class fondoBuscarProductos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) =>
            LinearGradient(
              colors: [Colors.white, Colors.white],
            ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('imagenes/comida.jpg'),
                  fit: BoxFit.cover,
                )
            )
        )
    );
  }
}

class fondoNegociosWeb extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) =>
            LinearGradient(
              colors: [Colors.white, Colors.white],
            ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('imagenes/pared.jpg'),
                  fit: BoxFit.cover,
                )
            )
        )
    );
  }
}
class Comprasfondo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) =>
            LinearGradient(
              colors: [Colors.white, Colors.white],
            ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('imagenes/cafe.jpg'),
                  fit: BoxFit.cover,
                )
            )
        )
    );
  }
}

class fondoRegistro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) =>
            LinearGradient(
              colors: [Colors.black26, Colors.black26],
            ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('imagenes/registro4.jpg'),
                  fit: BoxFit.cover,
                )
            )
        )
    );
  }
}

class fondoNegoActividad extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) =>
            LinearGradient(
              colors: [Colors.black26, Colors.black26],
            ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('imagenes/comida2.jpg'),
                  fit: BoxFit.cover,
                )
            )
        )
    );
  }
}

class fondocategorias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) =>
            LinearGradient(
              colors: [Colors.black26, Colors.black26],
            ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('imagenes/comida3.jpg'),
                  fit: BoxFit.cover,
                )
            )
        )
    );
  }
}

