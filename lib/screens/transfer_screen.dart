import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';

class TransferScreen extends StatelessWidget {
  final String transferID;

  const TransferScreen({super.key, required this.transferID});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyAppbar(title: 'Transfer Screen ID: $transferID'),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Transfer Screen'),
                Text('ID: $transferID'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
