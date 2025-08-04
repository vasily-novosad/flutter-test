import 'package:flutter/material.dart';

import '../components/appbar/appbar.dart';
import '../widgets/safe_frame.dart';

class DischargeScreen extends StatelessWidget {
  const DischargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyAppbar(title: 'Нужен слив'),
        Expanded(
          child: SafeFrame(
            children: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text('Экран слива')],
            ),
          ),
        ),
      ],
    );
  }
}
