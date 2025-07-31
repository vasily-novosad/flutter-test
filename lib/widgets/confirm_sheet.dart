import 'package:flutter/material.dart';

import 'button.dart';

class ConfirmSheet {
  static Future<T?> show<T>(
      {required BuildContext context,
      required Widget text,
      required VoidCallback onDone,
      VoidCallback? onDismiss,
      bool? noNavigatorPop}) async {
    return await showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 300,
            child: Padding(
              padding: EdgeInsets.only(
                top: 30,
                left: 10,
                right: 10,
              ),
              child: Column(
                children: [
                  text,
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        text: 'Подтвердить',
                        onTap: () {
                          Navigator.of(context).pop();
                          onDone();
                        },
                      ),
                      SizedBox(width: 10),
                      Button(
                        text: 'Отмена',
                        onTap: () {
                          if (noNavigatorPop == null || !noNavigatorPop) {
                            Navigator.pop(context);
                          }
                          if (onDismiss != null) {
                            onDismiss();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
