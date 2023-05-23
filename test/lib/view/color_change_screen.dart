import 'package:flutter/material.dart';
import 'package:test/constants/color_constant.dart';
import 'package:test/constants/my_variables.dart';
import 'package:test/utils/size_utils.dart';
import 'package:test/view/select_screen_color.dart';
import 'package:test/widgets/app_decoration.dart';
import 'package:test/widgets/custom_app_bar.dart';
import 'package:test/widgets/custom_button.dart';
import 'package:test/widgets/custom_text_widget.dart';
import 'dart:math' as math;

import 'package:test/widgets/my_app_container_standard.dart';

import '../models/list_data_model.dart';

class ColorChange extends StatefulWidget {
  const ColorChange({super.key});

  @override
  State<ColorChange> createState() => _ColorChangeState();
}

class _ColorChangeState extends State<ColorChange> {
  Color _color = ColorConstant.white;
  void changeColor() {
    setState(() {
      _color = Color((math.Random().nextInt(1000) * 0xFFFF00)).withOpacity(1.0);
    });
  }

  bool showfeaturesList = false;
  int? selectedId = 1;

  List<FeaturesListModel> featuresList = [
    FeaturesListModel(featurename: 'Required Feature', id: 1),
    FeaturesListModel(featurename: 'Select Color', id: 2),
  ];

  @override
  Widget build(BuildContext context) {
    var featuresListInAppBar = Container(
      height: getVerticalSize(80),
      width: getHorizontalSize(150),
      margin: getMargin(top: 5, right: 15),
      decoration: AppDecoration.whiteOutlineBlack0005Shadow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: getPadding(all: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: featuresList
                    .map((e) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedId = e.id;
                              showfeaturesList = !showfeaturesList;
                            });
                          },
                          child: CustomTextWidget(
                            text: e.featurename!,
                            color: ColorConstant.blue,
                            padding: getPadding(top: 5, bottom: 5),
                          ),
                        ))
                    .toList(),
              ),
            )),
          ),
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: selectedId == 1 ? 'Random Colors' : 'Selected Color',
          height: getVerticalSize(80),
          actions: [
            CustomButton(
              margin: getMargin(right: 20),
              height: getVerticalSize(42),
              width: getHorizontalSize(141),
              alignment: Alignment.centerRight,
              backgroundColor: ColorConstant.white,
              text: selectedId == 1 ? "Required Feature" : "Select Color",
              textColor: ColorConstant.blue,
              fontWeight: FontWeight.w500,
              onTap: () {
                setState(() {
                  showfeaturesList = !showfeaturesList;
                });
              },
              radius: getHorizontalSize(100),
              suffixWidget: const Icon(Icons.keyboard_arrow_down_sharp),
            ),
          ],
        ),
        body: Stack(children: [
          selectedId == 1
              ? GestureDetector(
                  onTap: () {
                    changeColor();
                  },
                  child: MyAppContainerStandard(
                      color: _color,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWidget(
                            text: 'Hello World',
                            color: ColorConstant.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyVariables.textFontFamilyRoboto,
                            size: 24,
                          ),
                        ],
                      )),
                )
              : const SelectScreenColor(),
          showfeaturesList == true
              ? Align(
                  alignment: Alignment.topRight,
                  child: featuresListInAppBar,
                )
              : Container(),
        ]),
      ),
    );
  }
}
