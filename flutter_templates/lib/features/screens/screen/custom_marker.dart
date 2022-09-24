import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onMapcreated(GoogleMapController controller) {
    setState(() {
      markers.add(const Marker(
        markerId: MarkerId('1'),
        position: LatLng(13.007488, 77.598656),
        infoWindow: InfoWindow(
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
      ));
      markers.add(const Marker(
        markerId: MarkerId('2'),
        position: LatLng(13.007488, 77.598656),
        infoWindow: InfoWindow(
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
      ));
      markers.add(const Marker(
        markerId: MarkerId('3'),
        position: LatLng(13.007488, 77.598656),
        infoWindow: InfoWindow(
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
      ));
      markers.add(const Marker(
        markerId: MarkerId('4'),
        position: LatLng(13.007488, 77.598656),
        infoWindow: InfoWindow(
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
      ));
      markers.add(const Marker(
        markerId: MarkerId('5'),
        position: LatLng(13.007488, 77.598656),
        infoWindow: InfoWindow(
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
      ));
      markers.add(const Marker(
        markerId: MarkerId('6'),
        position: LatLng(13.007488, 77.598656),
        infoWindow: InfoWindow(
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
      ));
      markers.add(const Marker(
        markerId: MarkerId('7'),
        position: LatLng(13.007481, 77.598651),
        infoWindow: InfoWindow(
          title: 'Marker Title Third ',
          snippet: 'My Custom Subtitle',
        ),
      ));
      markers.add(const Marker(
        markerId: MarkerId('8'),
        position: LatLng(13.001916, 77.588849),
        infoWindow: InfoWindow(
          title: 'Marker Title Fourth ',
          snippet: 'My Custom Subtitle',
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(13.007481, 77.598656),
            zoom: 10,
          ),
          mapToolbarEnabled: true,
          buildingsEnabled: false,
          myLocationButtonEnabled: true,
          mapType: MapType.normal,
          markers: markers,
          onMapCreated: onMapcreated,
          zoomControlsEnabled: true,
        ),
      ),
    );
  }
}
