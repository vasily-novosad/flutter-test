import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/map_test_screen/MyMap.dart';

class MapTestScreen extends StatelessWidget {
  const MapTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyMap(),
    );
  }
}
