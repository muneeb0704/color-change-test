import 'package:flutter/material.dart';

class ColorConstant {
  // pass copied color hex value to fromHex method
  static Color scaffoldBackgroundColor = fromHex('#F5F5F5');
  static Color lightBlack2831 = fromHex('#283144');
  static Color white = fromHex('#ffffff');
  static Color blue = fromHex('#1566FA');
  static Color black = fromHex('#000000');
  static Color black0005 = fromHex('#05000000');
  static Color black003f = fromHex('#3f000000');
  static Color yellow = fromHex('#EDBA36');
  static Color green = fromHex('#2CB87D');
  static Color red = fromHex('#FA6F6F');

// This method will convert our hex value into Color
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
