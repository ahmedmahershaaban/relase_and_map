import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as mappp;
import 'package:map_launcher/map_launcher.dart';
import 'package:release_and_map/models/user.dart';

class MapSample extends StatefulWidget {
  MapSample({@required this.userGeo});
  final Geo userGeo;
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  var availableMaps;
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition kGooglePlex;

  CameraPosition kLake;

  void syncAvaiable() async {
    availableMaps = await MapLauncher.installedMaps;
  }

  Future<void> openGoogleMaps() async {
    await availableMaps.first.showMarker(
      coords: Coords(
        double.parse(widget.userGeo.lat),
        double.parse(widget.userGeo.lng),
      ),
      title: "Ocean Beach",
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );
    kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(
            double.parse(widget.userGeo.lat), double.parse(widget.userGeo.lng)),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    syncAvaiable();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(),
        body: GoogleMap(
          mapType: mappp.MapType.hybrid,
          initialCameraPosition: kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: Row(
          children: [
            SizedBox(width: 20),
            FloatingActionButton.extended(
              onPressed: _goToTheLake,
              label: Text('To the lake!'),
              icon: Icon(Icons.directions_boat),
            ),
            SizedBox(width: 10),
            FloatingActionButton.extended(
              onPressed: openGoogleMaps,
              label: Text('open Google Maps!'),
              icon: Icon(Icons.location_city),
            ),
          ],
        ));
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }
}
