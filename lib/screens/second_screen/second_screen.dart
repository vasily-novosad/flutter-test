import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(builder: (context) {
        return Column(
          children: [
            const Text('The second screen'),
          ],
        );
      }),
    );
  }
}
