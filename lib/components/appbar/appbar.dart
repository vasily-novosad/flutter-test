import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';

class MyAppbar {
  Text title;
  MyAppbar(this.title);

  AppBar of(BuildContext context) {
    return AppBar(
        title: title,
        centerTitle: true,
        elevation: 12,
        leading: Builder(builder: (BuildContext context) {
          if (!context.canPop()) {
            return SizedBox();
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
