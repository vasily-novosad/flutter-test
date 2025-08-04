import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';
import 'package:flutter_test_app/widgets/safe_frame.dart';

import '../themes/main/colors.dart';

class TransferScreen extends StatelessWidget {
  final String transferID;

  const TransferScreen({super.key, required this.transferID});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyAppbar(title: 'Заявка №: $transferID'),
        Expanded(
          child: SingleChildScrollView(
            child: SafeFrame(
              children: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Column(
                      children: [SizedBox(
                        height: 30,
                      ),
                        Text('кп. Кривые ручки'),
                        Text('10.5m'),
                        SizedBox(height: 30,),
                        Text(
                          'Ул. Цветочная $transferID',
                          style: TextStyle(
                              color: ThemeColors.textPrimary.withAlpha(120)
                          ),
                        )],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
