import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../themes/main/colors.dart';

class TransfersListWidget extends StatelessWidget {
  final double? length;
  const TransfersListWidget({super.key, this.length});

  @override
  Widget build(BuildContext context) {
    VoidCallback goToSpecifiedTransfer(String id) {
      return () => context.go('/transfers/transfer/$id');
    }

    List<Widget> items = [];

    final double transfersCount = length ?? 100;
    for (int i in Iterable<int>.generate(transfersCount.toInt()).toList()) {
      items.add(Material(
          color: ThemeColors.background,
          child: InkWell(
            onTap: goToSpecifiedTransfer(i.toString()),
            child: Container(
              color: ThemeColors.bottomBarBackground,
              padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
              margin: EdgeInsets.only(bottom: 1, top: 1),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('кп. Кривые ручки'),
                      Text('10.5m'),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text(
                        'Ул. Цветочная $i',
                        style: TextStyle(
                          color: ThemeColors.textPrimary.withAlpha(120)
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )));
    }

    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return items[index];
      },
    );
  }
}
