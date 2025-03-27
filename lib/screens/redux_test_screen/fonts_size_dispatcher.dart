import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_app/redux/app/app_state.dart';
import 'package:flutter_test_app/redux/ui/ui_actions.dart';
import 'package:flutter_test_app/redux/ui/ui_state.dart';

final class FontSizeDispatcher extends StatelessWidget {
  const FontSizeDispatcher({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnPressCreatorDispatcher>(
      converter: (store) =>
          (value) => () => store.dispatch(UIActionSetFontName(value)),
      builder: (context, dispatcher) {
        return Row(
          children: [
            ElevatedButton(
              onPressed: dispatcher(FontName.fontOne),
              child: Text('Set one'),
            ),
            ElevatedButton(
              onPressed: dispatcher(FontName.fontTwo),
              child: Text('Set two'),
            ),
          ],
        );
      },
    );
  }
}

typedef OnPressCreatorDispatcher = void Function() Function(FontName value);
