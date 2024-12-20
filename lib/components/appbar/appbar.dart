import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppbar {
  const MyAppbar();

  AppBar getAppBar(BuildContext context) {
    return AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xffffffff),
        centerTitle: true,
        elevation: 12,
        leading: Builder(builder: (BuildContext context) {
          if (!context.canPop()) {
            return SizedBox.shrink();
          }

          return IconButton(
            icon: const Icon(Icons.arrow_back),
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
