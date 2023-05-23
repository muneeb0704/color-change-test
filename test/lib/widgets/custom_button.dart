import 'package:flutter/material.dart';
import 'package:test/constants/color_constant.dart';
import 'package:test/constants/my_variables.dart';
import 'package:test/utils/size_utils.dart';
import 'package:test/widgets/custom_text_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.padding,
    this.alignment,
    this.margin,
    this.onTap,
    this.width,
    this.height,
    this.text,
    this.textSize,
    this.textColor,
    this.fontWeight,
    this.prefixWidget,
    this.suffixWidget,
    this.radius,
    this.gradient,
    this.backgroundColor,
    this.borderColor,
    this.borderColorWidth,
    super.key,
  });

  final double? width;
  final double? height;
  final Alignment? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? radius;
  final Gradient? gradient;
  final String? text;
  final double? textSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final VoidCallback? onTap;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderColorWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: _buildButtonWidget(),
    );
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonChildWidget(),
      ),
    );
  }

  _buildButtonChildWidget() {
    if (gradient != null) {
      return Container(
        width: width ?? size.width,
        height: height ?? getVerticalSize(44),
        padding: padding ?? getPadding(all: 4),
        decoration: _buildDecoration(),
        child: _buildButtonWithOrWithoutIcon(),
      );
    } else {
      return _buildButtonWithOrWithoutIcon();
    }
  }

  _buildButtonWithOrWithoutIcon() {
    var textWidget = CustomTextWidget(
      text: text ?? "",
      textAlign: TextAlign.center,
      color: textColor ?? ColorConstant.white,
      size: getFontSize(textSize ?? 14),
      fontFamily: MyVariables.textFontFamilyRoboto,
      fontWeight: fontWeight ?? FontWeight.w600,
      lineHeight: getVerticalSize(1.21),
    );

    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? Container(),
          textWidget,
          suffixWidget ?? Container(),
        ],
      );
    } else {
      return textWidget;
    }
  }

  _buildDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(
        getHorizontalSize(radius ?? 10.00),
      ),
      gradient: gradient,
    );
  }

  _buildTextButtonStyle() {
    if (gradient != null) {
      return TextButton.styleFrom(
        padding: EdgeInsets.zero,
      );
    } else {
      return TextButton.styleFrom(
        fixedSize: Size(
          width ?? size.width,
          height ?? getVerticalSize(44),
        ),
        padding: padding ?? getPadding(all: 4),
        backgroundColor: backgroundColor ?? ColorConstant.blue,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderColorWidth ?? 1,
          ),
          borderRadius: BorderRadius.circular(
            getHorizontalSize(radius ?? 10.00),
          ),
        ),
      );
    }
  }
}
