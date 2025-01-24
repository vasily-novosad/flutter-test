import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/button/button.dart';
import 'package:flutter_test_app/screens/home_screen/order_info.dart';
import 'package:flutter_test_app/services/storage_manager.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print('>>>>>>> Home render');

    return Scrollbar(
      child: Center(
        child: Builder(builder: (context) {
          return Column(
            children: [
              OrderInfo(),
              ElevatedButton(
                  child: Text('Go to Login screen'),
                  onPressed: () {
                    context.go('/login');
                  }),
              ElevatedButton(
                  child: Text('Go to info'),
                  onPressed: () {
                    context.go('/profile/info');
                  }),
              Button(
                  text: 'Clear cache',
                  onPressed: () {
                    StorageManager(mode: StorageManagerMode.cache)
                        .deleteStore();
                  }),
            ],
          );
        }),
      ),
    );
  }
}
