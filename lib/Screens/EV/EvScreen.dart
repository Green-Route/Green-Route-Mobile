import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EvHomeScreen extends StatefulWidget {
  @override
  _EvHomeScreenState createState() => _EvHomeScreenState();
}

class _EvHomeScreenState extends State<EvHomeScreen> {
  final Set<Marker> _markers = {};
  GoogleMapController? _mapController;
  LatLng _selectedLocation = LatLng(42.306678989398385, -83.0649009190057); // Default location

  List<LatLng> _locations = [
    LatLng(42.320097225916875, -83.03935647103404),
    LatLng(42.31171958144831, -83.03214669355964),
    LatLng(42.32111262218964, -83.03454995271777),
    LatLng(42.31552773991512, -83.0211603659796),
    LatLng(42.31425837936192, -83.00914407018892),
    LatLng(42.30207121541498, -83.01017403839955),
    LatLng(42.27895990720015, -83.00777077924144)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Ev Stations Nearby'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _selectedLocation,
          zoom: 10,
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
          _addMarkers();
        },
      ),
    );
  }

  void _addMarkers() {
    for (int i = 0; i < _locations.length; i++) {
      _markers.add(Marker(
        markerId: MarkerId(i.toString()),
        position: _locations[i],
        onTap: () => _onMarkerTapped(_locations[i]),
      ));
    }
    setState(() {});
  }

  void _onMarkerTapped(LatLng location) {
    _mapController!.animateCamera(CameraUpdate.newLatLng(location));
    setState(() {
      _selectedLocation = location;
    });
  }
}
