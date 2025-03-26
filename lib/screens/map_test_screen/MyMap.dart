import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  bool _inited = false;
  MapboxMap? _mapboxMap;
  MapOptions? mapOptions;
  CameraOptions camera = CameraOptions(
      center: Point(coordinates: Position(-98.0, 39.5)),
      zoom: 2,
      bearing: 0,
      pitch: 0);

  void _init() {


    String ACCESS_TOKEN =
        'pk.eyJ1IjoidGxrdHJhbnNmZXIiLCJhIjoiY2t3MXZnNHFmMDQ1dTMxcWxrd3Bxem82MSJ9.yj2Nd75H9_LqcZuLZdWKug';
    MapboxOptions.setAccessToken(ACCESS_TOKEN);
    print('>>>>>>>>> Init function');
    setState(() {

      _inited = true;
    });
  }

  void _onMapCreated(MapboxMap mapboxMap) {
    setState(() {
      _mapboxMap = mapboxMap;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_inited) {
      _init();

      return Column(
        children: [
          ElevatedButton(onPressed: () {
            setState(() {
              _inited = true;
            });
          }, child: Text("Press to load map"))
        ],
      );
    }
    return MapWidget(
      key: ValueKey("mapWeight"),
      cameraOptions: camera,
      onMapCreated: _onMapCreated,
    );
  }
}
