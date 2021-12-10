import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyectoc4/DescripcionNegocio.dart';
import 'package:proyectoc4/listaNegocios.dart';

class Geolocalizacion extends StatefulWidget {
  final Direccion direccion;
  Geolocalizacion({required this.direccion}) ;

  @override
  _GeolocalizacionState createState() => _GeolocalizacionState();
}

class _GeolocalizacionState extends State<Geolocalizacion> {
  final Set<Marker> _marker = Set();

  Widget build(BuildContext context) {

    _marker.add(Marker(
        markerId: MarkerId(widget.direccion.Negocio),
      position: LatLng(widget.direccion.latitud,widget.direccion.longitud),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      infoWindow: InfoWindow(
        title: widget.direccion.Negocio,
        snippet: widget.direccion.direccionNum
      )
    ),
    );

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Geolocalizacion"),
        ),
        body: GoogleMap(
          markers: _marker,
          initialCameraPosition: CameraPosition(
              target: LatLng(widget.direccion.latitud, widget.direccion.longitud),
              //target: LatLng(4.732414, -74.066078),
            zoom: 17
          ),
        ),
      ),
    );
  }
}


