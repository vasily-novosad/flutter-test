// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/button/button.dart';
import 'package:flutter_test_app/routes.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_test_app/screens/home_screen/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(builder: (context) {
        return Column(
          children: [
            const Text('Hello'),
            const SizedBox(
              height: 20,
            ),
            Button(
                text: 'Go to /home/info',
                onPressed: () {
                  // ignore: avoid_print
                  context.go('/home/info');
                })
          ],
        );
      }),
    );
  }
}
