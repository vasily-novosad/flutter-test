import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/button.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final streamController = StreamController<Status>.broadcast();


    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Help Screen'),
          StreamBuilder<Status>(
            stream: streamController.stream,
            initialData: Status.notSet,
            builder: (context, snap) {
              return Text(
                'Status is ${snap.data.toString()}',
              );
            },
          ),
          Button(
            text: 'Set status',
            onTap: () {
              streamController.add(Status.success);
            },
          ),
          Button(
            text: 'Set status 2',
            onTap: () {
              streamController.add(Status.invalid);
            },
          )
        ],
      ),
    );
  }
}

enum Status { notSet, success, invalid }

class _HelpScreenModel extends Object {
  final _status = StreamController<Status>.broadcast();

  Stream<Status> get status => _status.stream;
}
