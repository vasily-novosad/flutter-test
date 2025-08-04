import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';
import 'package:flutter_test_app/widgets/safe_frame.dart';
import 'package:flutter_test_app/widgets/transfers_list_widget.dart';

class TransfersScreen extends StatelessWidget {
  final double? length;
  const TransfersScreen({super.key, this.length});

  @override
  Widget build(BuildContext context) {
    return SafeFrame(
      children: Column(
        children: [
          MyAppbar(title: 'Заявки'),
          Expanded(child: TransfersListWidget()),
        ],
      ),
    );
  }
}
