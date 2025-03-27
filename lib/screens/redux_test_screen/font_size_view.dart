import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_app/redux/app/app_state.dart';
import 'package:flutter_test_app/redux/ui/ui_state.dart';

final class FontSizeView extends StatelessWidget {
  const FontSizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FontName>(
      converter: (store) => store.state.ui.fontName,
      distinct: true,
      builder: (context, fontName) {
        return Column(
          children: [
            Column(
              children: [
                const Text('Current is: '),
                Text(
                  fontName.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
