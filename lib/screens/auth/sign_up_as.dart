import 'package:flutter/material.dart';
import 'package:uoodmaish_hospital_user/constants.dart';
import 'package:uoodmaish_hospital_user/screens/auth/sign_up.dart';
import 'package:uoodmaish_hospital_user/widgets/index.dart';
import 'package:uoodmaish_hospital_user/widgets/widgets.dart';

// ignore: must_be_immutable
class SignUpAs extends StatefulWidget {
  @override
  _SignUpAsState createState() => _SignUpAsState();
}

class _SignUpAsState extends State<SignUpAs> {
  static const List<String> _signUpAs = [
    "Government employee",
    "Public User",
    "Hospital"
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: gOIAppBar(context),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: mwidth * 0.10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                heading(text: "Sign up as"),
                dropdownContainer(
                    value: _signUpAs[index],
                    onChanged: (value) {
                      int i = _setIndex(value);
                      setState(() {
                        index = i;
                        print(index);
                      });
                    },
                    items: _signUpAs),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SignUp(
                      index: index,
                    ))),
        child: Icon(Icons.arrow_right_alt),
      ),
    );
  }

  int _setIndex(String selected) {
    switch (selected) {
      case "Government employee":
        return 0;
      case "Hospital":
        return 2;
      default:
        return 1;
    }
  }
}
