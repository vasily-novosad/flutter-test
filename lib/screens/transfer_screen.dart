import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';

import '../themes/main/colors.dart';

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
                Text('кп. Кривые ручки'),
                Text('10.5m'),
                SizedBox(height: 30,),
                Text(
                  'Ул. Цветочная $transferID',
                  style: TextStyle(
                      color: ThemeColors.textPrimary.withAlpha(120)
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
