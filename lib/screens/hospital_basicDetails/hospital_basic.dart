import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uoodmaish_hospital_user/constants.dart';
import 'package:uoodmaish_hospital_user/screens/hospital_basicDetails/hospital_patientDetails.dart';
import 'package:uoodmaish_hospital_user/utils/validators.dart';
import 'package:uoodmaish_hospital_user/widgets/buttons.dart';
import 'package:uoodmaish_hospital_user/widgets/headings.dart';
import 'package:uoodmaish_hospital_user/widgets/index.dart';
import 'package:uoodmaish_hospital_user/widgets/widgets.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class HospitalBasicDetails extends StatefulWidget {
  @override
  _HospitalBasicDetailsState createState() => _HospitalBasicDetailsState();
}

class _HospitalBasicDetailsState extends State<HospitalBasicDetails> {
  final _publicSignUpKey = GlobalKey<FormState>();
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _totalPatientcontroller = TextEditingController();
  TextEditingController _totalBedscontroller = TextEditingController();
  TextEditingController _occupiedBedscontroller = TextEditingController();
  TextEditingController _emptyBedscontroller = TextEditingController();
  TextEditingController _oxygencontroller = TextEditingController();
  TextEditingController _medicineStatuscontroller = TextEditingController();

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
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HospitalPatientDetails()));
                            },
                            child: goldenBorderButton("Patient Details"))
                      ],
                    ),
                    SizedBox()
                  ],
                ),
              ),
              Form(
                key: _publicSignUpKey,
                child: Container(
                  width: width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: height * 0.03),
                      Row(
                        children: [
                          Expanded(
                              flex: 2, child: heading(text: "Hospital ID")),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: KTextFormField(
                              controller: _usernamecontroller,
                              hintText: "Enter Hospital ID",
                              //  validation: (value) => validateID(value),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          Expanded(
                              flex: 2, child: heading(text: "Total Patients")),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: KTextFormField(
                              controller: _totalPatientcontroller,
                              hintText: "Enter Total Patients",
                              //  validation: (value) => validateID(value),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          Expanded(flex: 2, child: heading(text: "Total Beds")),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: KTextFormField(
                              controller: _totalBedscontroller,
                              hintText: "Enter Total Beds",
                              //   validation: (value) => validateID(value),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          Expanded(
                              flex: 2, child: heading(text: "Occupied Beds")),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: KTextFormField(
                              controller: _occupiedBedscontroller,
                              hintText: "Enter Occupied Beds",
                              //   validation: (value) => validateID(value),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          Expanded(flex: 2, child: heading(text: "Empty Beds")),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: KTextFormField(
                              controller: _emptyBedscontroller,
                              hintText: "Enter Empty Beds",
                              //   validation: (value) => validateID(value),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: heading(text: "Oxygen Availability")),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: KTextFormField(
                              controller: _oxygencontroller,
                              hintText: "Enter Oxygen Availability",
                              //   validation: (value) => validateID(value),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          Expanded(
                              flex: 2, child: heading(text: "Medicine Status")),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: KTextFormField(
                              controller: _medicineStatuscontroller,
                              hintText: "Enter Medicine Status",
                              //   validation: (value) => validateID(value),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.07),
                      Center(
                        child: CommonButton(
                          text: "Submit",
                          onPressed: () => _onSubmit(context),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit(context) {
    if (_publicSignUpKey.currentState!.validate()) {
      _publicSignUpKey.currentState!.save();
      hospitalbasic();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Details Submitted')));
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => SearchHospital()));
    }
  }

  Future<dynamic> hospitalbasic() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJOb29iQ29kZXIiLCJzdWIiOiI2MGM5ZDNmZmI1M2NlMDAwMTUyOGRmYjAiLCJpYXQiOjE2MjM4NDA3OTksImV4cCI6MTYyMzg0NDM5OX0.bqfMnnBcBqIKBtUvnHjRZg9m9N6ryS1Mc6NEUNPGoRA'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://covid-dash-combined.herokuapp.com/hospital/stats/basicdetails'));
    request.body =
        '''{\r\n"username": "${_usernamecontroller.text}",\r\n    "Total_Patients": ${int.parse(_totalPatientcontroller.text)},\r\n    "Total_Beds": ${(int.parse(_totalBedscontroller.text))},\r\n    "Occupied_Beds": ${(_occupiedBedscontroller.text)},\r\n    "Empty_Beds": ${(_emptyBedscontroller.text)},\r\n    "Oxygen_Availability ": ${(_oxygencontroller.text)},\r\n    "Medicine_Status": "${_medicineStatuscontroller.text}"\r\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      print("yes");
      print(await response.stream.bytesToString());
    } else {
      print("no");
      print(response.reasonPhrase);
    }
  }
}
