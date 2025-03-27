enum FontName { fontOne, fontTwo }

class UIState {
  late int counter;
  late FontName fontName;

  UIState({int? counter, FontName? fontName}) {
    this.counter = counter ?? 0;
    this.fontName = fontName ?? FontName.fontOne;
  }

  UIState copyWith({int? counter, FontName? fontName}) {
    return UIState(
      counter: counter ?? this.counter,
      fontName: fontName ?? this.fontName,
    );
  }
}
