import 'package:flutter/material.dart';
import 'package:uoodmaish_hospital_user/constants.dart';
import 'package:uoodmaish_hospital_user/widgets/buttons.dart';
import 'package:uoodmaish_hospital_user/widgets/headings.dart';
import 'package:uoodmaish_hospital_user/widgets/widgets.dart';

// ignore: must_be_immutable
class PublicBasicDetails extends StatelessWidget {
  List<String> hospitalNames = [
    "Bangalore Institute of  Medical Sciences",
    "Kolkata Institute of Medical Sciences",
    "Mumbai Institute of Medical Sciences"
  ];
  List<String> noOfBeds = [
    "General Beds - 20",
    "Ventilator Beds - 12",
    "ICU Beds - 5"
  ];
  List<String> noOfStaff = ["Nurses - 15", "Doctors - 40", "Helpers - 10"];
  List<String> departments = ["Othamology", "Cardiology", "Pediatrics"];
  List<String> docsPerDepartments = [
    "Othamology - 15",
    "Cardiology- 10",
    "Pediatrics -12"
  ];
  List<String> facilities = [
    "Oxygen Facility",
    "Covid Care Unit",
    "Medical Facility",
    "Extra Facility",
    "Home ICU",
    "Ambulance"
  ];
  List<String> hospitalTypes = ["Government", "Private"];

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    var height = mq.height;
    var width = mq.width;

    return Scaffold(
      appBar: gOIAppBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    backArrowBtn(context),
                    Row(
                      children: [
                        primarycolorButton("Basic Details"),
                        SizedBox(width: 10),
                        goldenBorderButton("Real Time Details")
                      ],
                    ),
                    SizedBox()
                  ],
                ),
              ),
              Container(
                width: width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: height * 0.03),
                    Row(
                      children: [
                        Expanded(
                            flex: 2, child: heading(text: "Hospital Name")),
                        SizedBox(width: 10),
                        Expanded(
                            flex: 4,
                            child: dropdownContainer(
                                value: hospitalNames[0],
                                onChanged: () {},
                                items: hospitalNames)),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        Expanded(flex: 2, child: heading(text: "No of Beds")),
                        SizedBox(width: 10),
                        Expanded(
                            flex: 4,
                            child: dropdownContainer(
                                value: noOfBeds[0],
                                onChanged: () {},
                                items: noOfBeds)),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        Expanded(flex: 2, child: heading(text: "No of Staff")),
                        SizedBox(width: 10),
                        Expanded(
                            flex: 4,
                            child: dropdownContainer(
                                value: noOfStaff[0],
                                onChanged: () {},
                                items: noOfStaff)),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        Expanded(flex: 2, child: heading(text: "Departments")),
                        SizedBox(width: 10),
                        Expanded(
                            flex: 4,
                            child: dropdownContainer(
                                value: departments[0],
                                onChanged: () {},
                                items: departments)),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        Expanded(
                            flex: 2, child: heading(text: "Doctor Per Dept")),
                        SizedBox(width: 10),
                        Expanded(
                            flex: 4,
                            child: dropdownContainer(
                                value: docsPerDepartments[0],
                                onChanged: () {},
                                items: docsPerDepartments)),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        Expanded(flex: 2, child: heading(text: "Facilities")),
                        SizedBox(width: 10),
                        Expanded(
                            flex: 4,
                            child: dropdownContainer(
                                value: facilities[0],
                                onChanged: () {},
                                items: facilities)),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        Expanded(
                            flex: 2, child: heading(text: "Hospital Type")),
                        SizedBox(width: 10),
                        Expanded(
                            flex: 4,
                            child: dropdownContainer(
                                value: hospitalTypes[0],
                                onChanged: () {},
                                items: hospitalTypes)),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
