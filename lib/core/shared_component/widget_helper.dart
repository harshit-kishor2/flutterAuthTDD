import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:qr_code/core/constant/index.dart';
import 'package:qr_code/core/shared_component/custom_text.dart';

Divider getDivider({
  double height = 10,
}) {
  return Divider(
    color: ColorConst.greyColor,
    height: height,
  );
}

SizedBox getSizeBox({
  double height = 15,
}) {
  return SizedBox(
    height: height,
  );
}
//  {END PAGE NAVIGATION}

AppBar getAppBarWithBackBtn({
  String title = '',
  Color bgColor = ColorConst.appColor,
  double fontSize = 15,
  String titleTag = '',
  Widget? icon,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: bgColor,
    leading: icon,
    actions: actions,
    centerTitle: true,
    title: Hero(
      tag: titleTag,
      child: getTxtColor(
        msg: title,
        txtColor: ColorConst.blackColor,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

//  {END TEXT VIEW}

bool isDarkMode() {
  // ThemeModel.isDarkTheme;
  var brightness = SchedulerBinding.instance?.window.platformBrightness;
  final isDarkMode = brightness == Brightness.dark;
  return isDarkMode; //appDakMode;
}
