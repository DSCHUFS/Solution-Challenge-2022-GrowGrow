import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {

  FirebaseFirestore firestore=FirebaseFirestore.instance;
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.566, 126.97),
    zoom: 11.5,
  );
  final List<Marker> markers = [];
  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId("marker_1"),
          position: LatLng(37.5642135, 127.0016985),
          draggable: true,
          icon:
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: InfoWindow(
            title: 'My First Tree',
            snippet: '220213',
          )),
      Marker(
        markerId: MarkerId("marker_2"),
        infoWindow: InfoWindow(title: 'My Second Tree', snippet: '220214'),
        draggable: true,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(36.33, 127.4),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        mapType: MapType.normal,
        markers: Set.from(_createMarker()),
        initialCameraPosition: _kGooglePlex,
        onCameraMove: (_) {},
        myLocationButtonEnabled: false,
      ),
    );
  }
}