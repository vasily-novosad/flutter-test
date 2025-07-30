import 'package:flutter/material.dart';
import 'package:flutter_test_app/themes/main/colors.dart';
import 'package:go_router/go_router.dart';

class MyAppbar extends StatelessWidget {
  final String title;

  const MyAppbar({
    super.key,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: ThemeColors.textPrimary),
        ),
        centerTitle: true,
        backgroundColor: ThemeColors.bottomBarBackground,
        elevation: 12,
        leading: Builder(builder: (BuildContext context) {
          if (!context.canPop()) {
            return SizedBox();
          }

          return IconButton(
            icon: Icon(Icons.arrow_back,
                // color: Color(0xffffffff),
                color: ThemeColors.textPrimary),
            tooltip: 'Go back',
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              }
            },
          );
        }));
  }
}
