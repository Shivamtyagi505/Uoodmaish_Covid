import 'package:flutter/material.dart';
import 'package:uoodmaish_hospital_user/constants.dart';
import 'package:uoodmaish_hospital_user/widgets/buttons.dart';
import 'package:uoodmaish_hospital_user/widgets/headings.dart';
import 'package:uoodmaish_hospital_user/widgets/widgets.dart';

class UserSignup extends StatefulWidget {
  @override
  _UserSignupState createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  bool isChecked = true;

  List<String> countries = ["India", "USA", "China", "Australia"];

  List<String> states = [
    "West Bengal",
    "Karnataka",
    "Maharashtra",
    "Gujrat",
    "Delhi"
  ];

  List<String> districts = ["Kolkata", "Delhi", "Mumbai", "Ahmedabad"];

  List<String> areas = ["Liluah", "Thane", "Pune", "Surat"];

  List<String> sectors = [
    "Sector 1",
    "Sector 2",
    "Sector 3",
    "Sector 4",
    "Sector 5",
    "Sector 6"
  ];

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    var height = mq.height;
    var width = mq.width;
    return Scaffold(
      appBar: gOIAppBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: width * 0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.05),
                heading(text: "Enter Your Country"),
                dropdownContainer(
                    value: countries[0], onChanged: () {}, items: countries),
                SizedBox(height: height * 0.02),
                heading(text: "Enter Your State"),
                dropdownContainer(
                    value: states[0], onChanged: () {}, items: states),
                SizedBox(height: height * 0.02),
                heading(text: "Enter Your District"),
                dropdownContainer(
                    value: districts[0], onChanged: () {}, items: districts),
                SizedBox(height: height * 0.02),
                heading(text: "Enter Your Area"),
                dropdownContainer(
                    value: areas[0], onChanged: () {}, items: areas),
                SizedBox(height: height * 0.02),
                heading(text: "Enter Your Ward/Sector/Landmark"),
                dropdownContainer(
                    value: sectors[0], onChanged: () {}, items: sectors),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      height: 20.0,
                      width: 20.0,
                      child: Checkbox(
                          value: isChecked,
                          activeColor: Colors.white,
                          checkColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                    ),
                    SizedBox(width: 7),
                    heading(
                        text: "search for nearby hospitals",
                        scale: 0.9,
                        weight: FontWeight.w400)
                  ],
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [heading(text: "OR", weight: FontWeight.w300)],
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.my_location),
                    SizedBox(width: 3),
                    heading(text: "Detect location", weight: FontWeight.w400)
                  ],
                ),
                SizedBox(height: height * 0.02),
                goldenButton("Search For Hospitals")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
