library navbar.globals;

import 'package:flutter/material.dart';

class AppColors {
  static Color red = HexColor('#ED3237');
  static Color purple = HexColor('#A8518A');
  static Color blue = HexColor('#3E4095');
  static Color grey = HexColor('#404040');
  static Color darkGrey = HexColor('#131313');
  static Color lightGrey = HexColor('505050');
  static Color innerContainer = HexColor('#111111');

  static Color successBG = HexColor('#03871A');
  static Color success = HexColor('#70E083');

  static Color darken(Color? color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color ?? Colors.grey);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color lighten(Color? color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color ?? Colors.grey);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class Globals {
  static InputDecoration personalDecoration(String type) {
    return InputDecoration(
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.darken(Color.fromARGB(255, 255, 29, 29)),
              width: 2),
          borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 255, 29, 29)),
          borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 213, 213, 213)),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 2),
          borderRadius: BorderRadius.circular(10)),
      hintText: type,
      contentPadding: const EdgeInsets.only(left: 20),
      border: InputBorder.none,
    );
  }
}
