import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uoodmaish_hospital_user/constants.dart';
import 'package:uoodmaish_hospital_user/routes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: primaryColor,
    statusBarColor: primaryColor,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  Routes();
}
