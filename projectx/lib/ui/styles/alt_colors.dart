import 'package:flutter/material.dart';
import 'package:projectx/main.dart';

class AltColors {
  static const colors = Colors;

  static const light = ColorsLight;

  static const DarkAwareColor _appbarX = DarkAwareColor(0xFFFE654F, <bool, Color>{
    true: Color(0xFFFF6262),
    false: Color(0xFFFE654F),
  });

  static const DarkAwareColor _appbarX1 = DarkAwareColor(0xFFFE654F, <bool, Color>{
    true: Color(0xFFFF6262),
    false: Colors.white,
  });

  static const DarkAwareColor _backgroundX = DarkAwareColor(0xFFFE654F, <bool, Color>{
    false: Colors.white,
    true: Colors.transparent,
  });

  static const DarkAwareColor _textNormalX = DarkAwareColor(0xFFFE654F, <bool, Color>{
    true: Colors.white,
    false: Colors.black,
  });

  static const DarkAwareColor _textHighlightX = DarkAwareColor(0xFFFE654F, <bool, Color>{
    true: Colors.white,
    false: _appbarX,
  });

  static Color get appbarX => _appbarX.get(!currentThemeModeLight.value);

  static Color get appbarX1 => _appbarX1.get(!currentThemeModeLight.value);

  static Color get appbarX2 => _appbarX1.get(currentThemeModeLight.value);

  static Color get backgroundX => _backgroundX.get(!currentThemeModeLight.value);

  static Color get textNormalX => _textNormalX.get(!currentThemeModeLight.value);

  static Color get textHighlightX => _textHighlightX.get(!currentThemeModeLight.value);
}

class DarkAwareColor extends ColorSwatch<bool> {
  const DarkAwareColor(int primary, Map<bool, Color> swatch) : super(primary, swatch);

  Color get dark => this[true]!;

  Color get light => this[false]!;

  Color get(bool dark) => this[dark]!;
}

class ColorsLight {
  static const linearGradientStart = Color(0xFFFD7292);
  static const linearGradientEnd = Color(0xFFFD5E2C);
  static const appbar = Color(0xFFFE654F);
}

class ColorsDark {
  static const greyBlack = Color(0xFF555555);
  static const appbar = Color(0xFFFF6262);
}
