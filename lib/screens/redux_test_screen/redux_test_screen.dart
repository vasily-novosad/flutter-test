import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/redux_test_screen/font_size_view.dart';
import 'package:flutter_test_app/screens/redux_test_screen/fonts_size_dispatcher.dart';

final class ReduxTestScreen extends StatelessWidget {
  const ReduxTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux test s'),
      ),
      body: Row(
        children: [
          FontSizeView(),
          FontSizeDispatcher(),
        ],
      ),
    );
  }
}
