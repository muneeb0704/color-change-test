import 'package:flutter/material.dart';
import 'package:test/constants/color_constant.dart';

import '../utils/size_utils.dart';

class AppDecoration {
  static BoxDecoration get whiteOutlineBlack0005Shadow => BoxDecoration(
        color: ColorConstant.white,
        border: Border.all(
          color: ColorConstant.black0005,
          width: getHorizontalSize(1),
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
        borderRadius: BorderRadius.circular(getHorizontalSize(10)),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black003f,
            blurRadius: getHorizontalSize(2),
            offset: const Offset(0, 1),
          ),
        ],
      );
}
