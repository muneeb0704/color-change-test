import 'package:flutter/services.dart';
import 'package:test/utils/size_utils.dart';

class MyVariables {
  static var scaffoldBodyPadding = getPadding(all: 8);

  static var appBarHeight = getVerticalSize(94);

  static var emailValidatorRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static var allowDoubleValueRegEx =
      FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));

  static var textFontFamilyRoboto = 'Roboto';

  static var workQueueAccountTypeIdIndivual = 1;
  static var workQueueAccountTypeIdForTeam = 2;
}
