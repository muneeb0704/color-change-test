import 'package:flutter/material.dart';
import 'package:test/constants/color_constant.dart';
import 'package:test/utils/size_utils.dart';

class MyAppContainerStandard extends StatelessWidget {
  const MyAppContainerStandard(
      {required this.child, this.color, this.padding, super.key});

  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? ColorConstant.scaffoldBackgroundColor,
      ),
      child: child,
    );
  }
}
