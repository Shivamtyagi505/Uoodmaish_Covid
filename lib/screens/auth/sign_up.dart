import 'package:flutter/material.dart';
import 'package:uoodmaish_hospital_user/screens/auth/signup_gov.dart';
import 'package:uoodmaish_hospital_user/screens/auth/signup_hospital.dart';
import 'package:uoodmaish_hospital_user/screens/auth/signup_public.dart';

class SignUp extends StatelessWidget {
  final int? index;

  const SignUp({Key? key, @required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return SignUpAsGov();
      case 1:
        return SignUpAsPublic();
      case 2:
        return SignUpAsHospital();
      default:
        return SignUpAsPublic();
    }
  }
}
