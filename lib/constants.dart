import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF091D42);
const Color backgroundColor = Color(0xFFFFFFFF);
const Color labelColor = Color(0xFF515151);
const double defaultPadding = 10.0;
const Color greyColor = Color(0XFFE4E4E4);

///App Theme
ThemeData themeData = ThemeData.light().copyWith(
  brightness: Brightness.light,
  scaffoldBackgroundColor: backgroundColor,
  accentColor: primaryColor,
);

// Government Of India AppBar
AppBar gOIAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: primaryColor,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 70, child: Image.asset("assets/images/goi_logo.png")),
    ),
    title: Text(
      "Government Of India",
      style: TextStyle(color: Colors.white),
    ),
  );
}

InputDecoration inputDecoration = InputDecoration(
    border: InputBorder.none,
    hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
    fillColor: dropDownContainerColor,
    filled: true,
    labelStyle: TextStyle(color: labelColor, fontWeight: FontWeight.w600),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(3),
      borderSide: const BorderSide(color: greyColor, width: 0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(3),
      borderSide: const BorderSide(color: primaryColor, width: 0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(3),
      borderSide: const BorderSide(color: Colors.red, width: 0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(3),
      borderSide: const BorderSide(color: Colors.red, width: 0),
    ));

Color dropDownContainerColor = Color(0xffDFDFDF);
