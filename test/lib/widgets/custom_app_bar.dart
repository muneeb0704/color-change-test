import 'package:flutter/material.dart';
import 'package:test/constants/color_constant.dart';
import 'package:test/constants/my_variables.dart';
import 'package:test/widgets/custom_text_widget.dart';

import '../utils/size_utils.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar(
      {this.height,
      this.leadingWidth,
      this.leading,
      this.title,
      this.centerTitle,
      this.actions,
      this.shape,
      this.leadingCustomOnTap,
      super.key});

  final double? height;
  final double? leadingWidth;
  final Widget? leading;
  final String? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final ShapeBorder? shape;
  final Function()? leadingCustomOnTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? MyVariables.appBarHeight,
      automaticallyImplyLeading: false,
      backgroundColor: ColorConstant.blue,
      leadingWidth: leadingWidth ?? getHorizontalSize(30),
      leading: leading ?? Container(),
      title: CustomTextWidget(
        text: title ?? '',
        color: ColorConstant.white,
        size: 20,
        fontWeight: FontWeight.w600,
        fontFamily: MyVariables.textFontFamilyRoboto,
      ),
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
      shape: shape,
    );
  }

  onTapArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Size get preferredSize => Size(
        size.width,
        height ?? MyVariables.appBarHeight,
      );
}
