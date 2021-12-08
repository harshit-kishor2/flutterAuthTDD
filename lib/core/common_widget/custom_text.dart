import 'package:flutter/material.dart';
import 'package:qr_code/core/constant/index.dart';

Text getLable({
  required String msg,
  FontWeight fontWeight = FontWeight.normal,
  int? maxLines,
  double fontSize = 15,
  TextAlign textAlign = TextAlign.start,
}) {
  return Text(
    msg,
    maxLines: maxLines,
    textAlign: textAlign,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  );
}

Text getTxtWhiteColor(
    {required String msg,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _getFontStyle(
        txtColor: ColorConst.whiteColor,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtBlackColor({
  required String msg,
  double fontSize = 15,
  FontWeight fontWeight = FontWeight.normal,
  int? maxLines,
  TextAlign textAlign = TextAlign.start,
}) {
  return Text(
    msg,
    textAlign: textAlign,
    maxLines: maxLines,
    style: _getFontStyle(
      txtColor: ColorConst.blackColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}

Text getTxtGreyColor({
  required String msg,
  double fontSize = 15,
  FontWeight fontWeight = FontWeight.normal,
  int? maxLines,
  TextAlign textAlign = TextAlign.start,
}) {
  return Text(
    msg,
    textAlign: textAlign,
    maxLines: maxLines,
    style: _getFontStyle(
      txtColor: ColorConst.greyColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}

Text getTxtColor({
  required String msg,
  required Color txtColor,
  double fontSize = 15,
  FontWeight fontWeight = FontWeight.normal,
  int? maxLines,
  TextAlign textAlign = TextAlign.start,
}) {
  return Text(
    msg,
    textAlign: textAlign,
    maxLines: maxLines,
    style: _getFontStyle(
      txtColor: txtColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}

TextStyle _getFontStyle({
  required Color txtColor,
  double fontSize = 15,
  FontWeight fontWeight = FontWeight.normal,
  String fontFamily = AssetsConst.zillaSlabFont,
  TextDecoration txtDecoration = TextDecoration.none,
}) {
  return TextStyle(
    color: txtColor,
    fontSize: fontSize,
    decoration: txtDecoration,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
  );
}

//Style for custom text form field
InputDecoration textFieldStyle({
  String labelTextStr = "",
  String hintTextStr = "",
  suffixIcon,
}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(12),
    labelText: labelTextStr,
    hintText: hintTextStr,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    suffixIcon: suffixIcon,
  );
}
