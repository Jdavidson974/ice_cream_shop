import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  static const lat = -20.879206054127;
  static const lon = 55.44962013556664;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: FlutterMap(
        options: MapOptions(
          minZoom: 5.0, // Zoom minimum
          maxZoom: 18.0, // Zoom maximum (limite pour éviter les bugs)
          center: LatLng(lat, lon), // Coordonnées de la map
          zoom: 18.0, // Niveau de zoom initial
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.ice_cream_shop',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(lat, lon), // Position du marqueur
                builder: (ctx) => Icon(
                  Icons.location_on,
                  color: Colors.green, // Couleur du marqueur
                  size: 40.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
