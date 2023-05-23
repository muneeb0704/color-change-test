import 'package:flutter/material.dart';

class ColorConstant {
  // pass copied color hex value to fromHex method
  static Color scaffoldBackgroundColor = fromHex('#F5F5F5');

// This method will convert our hex value into Color
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
