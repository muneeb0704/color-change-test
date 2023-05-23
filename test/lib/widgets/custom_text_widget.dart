import 'package:flutter/material.dart';
import 'package:test/constants/color_constant.dart';
import 'package:test/constants/my_variables.dart';
import 'package:test/utils/size_utils.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {required this.text,
      this.color,
      this.size,
      this.fontWeight,
      this.maxLines,
      this.textAlign,
      this.overflow,
      this.fontStyle,
      this.fontFamily,
      this.lineHeight,
      this.letterSpacing,
      this.alignment,
      this.margin,
      this.padding,
      this.backgroundColor,
      this.height,
      this.width,
      this.radius,
      Key? key})
      : super(key: key);

  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? lineHeight;
  final double? letterSpacing;
  final Alignment? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: alignment,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(radius ?? 0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color ?? ColorConstant.lightBlack2831,
          fontSize: getFontSize(size ?? 16),
          fontWeight: fontWeight ?? FontWeight.w400,
          overflow: overflow,
          fontFamily: fontFamily ?? MyVariables.textFontFamilyRoboto,
          fontStyle: fontStyle,
          height: lineHeight,
        ),
        maxLines: maxLines,
        textAlign: textAlign,
      ),
    );
  }
}
