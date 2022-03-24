import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class MyTree extends StatefulWidget {
  @override
  State<MyTree> createState() => _MyTreeState();
}

class _MyTreeState extends State<MyTree> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My tree',
            style: TextStyle(
                color: Color(0xff615E5C),
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
          backgroundColor: Colors.white24,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.account_circle),
            color: Colors.lightBlue,
            iconSize: 40,
            onPressed: () {},
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color(0xff81dfa4),
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 400,
                    child: MapSample(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Color(0xff81dfa4),
                      width: 3,
                    ),
                  ),
                  child: _buildlist(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Image plant(int leading){
  if (leading == 0) {
    return Image.asset('images/100%.png');
  } else {
    return Image.asset('images/40%.png');
  }
}
Widget _buildlist() => ListView(children: [
  _tree('Seoul, Korea', '220213',0),
  _tree('Daejeon, Korea', '220214',1),
]);

ListTile _tree(String title, String subtitle, int leading) => ListTile(
  leading: plant(leading),
  title: Text(title),
  subtitle: Text(subtitle),
  trailing: Icon(Icons.more_vert),
);


class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.566, 126.97),
    zoom: 11.5,
  );

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
