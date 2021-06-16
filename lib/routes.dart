import 'package:flutter/material.dart';
import 'package:uoodmaish_hospital_user/constants.dart';
import 'package:uoodmaish_hospital_user/screens/auth/login.dart';
import 'package:uoodmaish_hospital_user/screens/auth/sign_up_as.dart';
import 'package:uoodmaish_hospital_user/screens/auth/signup_gov.dart';
import 'package:uoodmaish_hospital_user/screens/auth/signup_hospital.dart';
import 'package:uoodmaish_hospital_user/screens/auth/signup_public.dart';
import 'package:uoodmaish_hospital_user/screens/public_view/hospitals.dart';
import 'package:uoodmaish_hospital_user/screens/public_view/search_hostpital.dart';
import 'package:uoodmaish_hospital_user/screens/user_signup/user_signup_screen.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/login': (BuildContext context) => LoginPage(),
    '/user_signup': (BuildContext context) => UserSignup(),
    '/signup_as': (BuildContext context) => SignUpAs(),
    '/signup_public': (BuildContext context) => SignUpAsPublic(),
    '/signup_gov': (BuildContext context) => SignUpAsGov(),
    '/signup_hospital': (BuildContext context) => SignUpAsHospital(),
    '/search_hospital': (BuildContext context) => SearchHospital(),
    '/hospitals': (BuildContext context) => Hospitals(),
  };

  Routes() {
    runApp(new MaterialApp(
      theme: themeData,
      title: 'Uoodmaish Healthcare',
      routes: routes,
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    ));
  }
}
