import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';
import 'package:go_router/go_router.dart';

import '../themes/main/colors.dart';

class TransfersScreen extends StatelessWidget {
  const TransfersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VoidCallback goToSpecifiedTransfer(String id) {
      return () => context.go('/transfers/transfer/$id');
    }

    List<Widget> items = [];

    for (int i in Iterable<int>.generate(1000).toList()) {
      items.add(Material(
          color: ThemeColors.background,
          child: InkWell(
            onTap: goToSpecifiedTransfer(i.toString()),
            child: Container(
              color: ThemeColors.bottomBarBackground,
              padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
              margin: EdgeInsets.only(bottom: 1, top: 1),
              child: Text('Transfer $i'),
            ),
          )));
    }

    return Column(
      children: [
        MyAppbar(title: 'Transfers list'),
        Expanded(
            child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return items[index];
          },
        ))
      ],
    );
  }
}
