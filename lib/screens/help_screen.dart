import 'dart:async';

import 'package:flutter/material.dart';

import '../components/appbar/appbar.dart';
import '../widgets/button.dart';
import '../widgets/safe_frame.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final streamController = StreamController<Status>.broadcast();


    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyAppbar(title: 'Помощь'),
        Expanded(
          child: SafeFrame(
            children: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text('Экран диспетчера')],
            ),
          ),
        ),
      ],
    );
  }
}

enum Status { notSet, success, invalid }

class _HelpScreenModel extends Object {
  final _status = StreamController<Status>.broadcast();

  Stream<Status> get status => _status.stream;
}
