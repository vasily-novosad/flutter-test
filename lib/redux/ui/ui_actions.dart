import 'package:flutter_test_app/redux/ui/ui_state.dart';

class UIActionSetCounter {
  final int value;

  UIActionSetCounter(this.value);
}

class UIActionIncrementCounter {
  final int value;

  UIActionIncrementCounter(this.value);
}

class UIActionDecrementCounter {
  final int value;

  UIActionDecrementCounter(this.value);
}

class UIActionSetFontName {
  final FontName fontName;

  UIActionSetFontName(this.fontName);
}
