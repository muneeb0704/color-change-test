import 'package:flutter/material.dart';
import 'package:test/constants/color_constant.dart';
import 'package:test/constants/my_variables.dart';
import 'package:test/models/list_data_model.dart';
import 'package:test/utils/size_utils.dart';
import 'package:test/widgets/app_decoration.dart';
import 'package:test/widgets/custom_button.dart';
import 'package:test/widgets/custom_text_widget.dart';
import 'package:test/widgets/my_app_container_standard.dart';

class SelectScreenColor extends StatefulWidget {
  const SelectScreenColor({super.key});

  @override
  State<SelectScreenColor> createState() => _SelectScreenColorState();
}

class _SelectScreenColorState extends State<SelectScreenColor> {
  bool showColorsList = false;
  int? selectedId = 1;

  List<ColorsListModel> featuresList = [
    ColorsListModel(colorName: 'Red', colorId: 1),
    ColorsListModel(colorName: 'Yellow', colorId: 2),
    ColorsListModel(colorName: 'Green', colorId: 3),
  ];

  @override
  Widget build(BuildContext context) {
    var colorsList = Container(
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
                              selectedId = e.colorId;
                              showColorsList = !showColorsList;
                            });
                          },
                          child: CustomTextWidget(
                            text: e.colorName!,
                            color: ColorConstant.blue,
                            padding: getPadding(top: 5, bottom: 5),
                            fontFamily: MyVariables.textFontFamilyRoboto,
                          ),
                        ))
                    .toList(),
              ),
            )),
          ),
        ],
      ),
    );

    var colorBtn = CustomButton(
      margin: getMargin(right: 20),
      height: getVerticalSize(42),
      width: getHorizontalSize(141),
      backgroundColor: ColorConstant.white,
      text: selectedId == 1
          ? "Red"
          : selectedId == 2
              ? "Yellow"
              : "Green",
      textColor: ColorConstant.blue,
      fontWeight: FontWeight.w500,
      onTap: () {
        setState(() {
          showColorsList = !showColorsList;
        });
      },
      radius: getHorizontalSize(100),
      suffixWidget: const Icon(Icons.keyboard_arrow_down_sharp),
    );

    return SafeArea(
        child: Scaffold(
      body: MyAppContainerStandard(
          color: selectedId == 1
              ? ColorConstant.red
              : selectedId == 2
                  ? ColorConstant.yellow
                  : ColorConstant.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              colorBtn,
              showColorsList == true ? colorsList : Container(),
            ],
          )),
    ));
  }
}
