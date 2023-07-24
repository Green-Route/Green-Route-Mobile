import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TransitHomeScreen extends StatefulWidget {
  @override
  _TransitHomeScreenState createState() => _TransitHomeScreenState();
}

class _TransitHomeScreenState extends State<TransitHomeScreen> {
  final Set<Marker> _markers = {};
  GoogleMapController? _mapController;
  LatLng _selectedLocation = LatLng(42.31772, -83.04309); // Default location

  List<LatLng> _locations = [
    LatLng(37.7749, -122.4194), // San Francisco
    LatLng(34.0522, -118.2437), // Los Angeles
    LatLng(41.8781, -87.6298),  // Chicago
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Multiple Locations on Google Maps'),
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
