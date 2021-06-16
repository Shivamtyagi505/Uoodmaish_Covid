import 'package:flutter/material.dart';
import 'package:uoodmaish_hospital_user/constants.dart';
import 'package:uoodmaish_hospital_user/utils/validators.dart';
import 'package:uoodmaish_hospital_user/widgets/buttons.dart';
import 'package:uoodmaish_hospital_user/widgets/headings.dart';
import 'package:uoodmaish_hospital_user/widgets/text_fields.dart';
import 'package:uoodmaish_hospital_user/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class HospitalPatientDetails extends StatefulWidget {

  @override
  _HospitalPatientDetailsState createState() => _HospitalPatientDetailsState();
}

class _HospitalPatientDetailsState extends State<HospitalPatientDetails> {
 
  final _hospitalpatientKey = GlobalKey<FormState>();
   TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _patientNamecontroller = TextEditingController();
  TextEditingController _patientIDcontroller = TextEditingController();
  TextEditingController _patientAgecontroller = TextEditingController();
  TextEditingController _aadharcontroller = TextEditingController();
  TextEditingController _admissionDatecontroller = TextEditingController();
  TextEditingController _admissionDetailscontroller = TextEditingController();
  TextEditingController _dischargeDatecontroller = TextEditingController();
  TextEditingController _patientStatuscontroller = TextEditingController();

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
                        goldenBorderButton("Patient Details")
                      ],
                    ),
                    SizedBox()
                  ],
                ),
              ),
              Form(
                key: _hospitalpatientKey,
                child: Container(
                  width: width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: height * 0.03),
                       Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: heading(text: "Hospital ID")),
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
                              flex: 2,
                              child: heading(text: "Name of Patients")),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: KTextFormField(
                              controller: _patientNamecontroller,
                              hintText: "Enter Patient Name",
                            //  validation: (value) => validateID(value),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          Expanded(flex: 2, child: heading(text: "Patient ID")),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: KTextFormField(
                              controller: _patientIDcontroller,
                              hintText: "Enter Patient ID",
                            //  validation: (value) => validateID(value),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: heading(text: "Age Of Patients ")),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: KTextFormField(
                              controller: _patientAgecontroller,
                              hintText: "Enter Patient Age",
                          //    validation: (value) => validateID(value),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          Expanded(
                              flex: 2, child: heading(text: "Aadhar Number")),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: KTextFormField(
                              controller: _aadharcontroller,
                              hintText: "Enter Aadhar Number",
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
                              child: heading(text: "Date of Admission")),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: KTextFormField(
                              controller: _admissionDatecontroller,
                              hintText: "Enter Admission Date",
                            //  validation: (value) => validateID(value),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: heading(text: "Admission Details")),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: KTextFormField(
                              controller: _admissionDetailscontroller,
                              hintText: "Enter Admission Details",
                           //   validation: (value) => validateID(value),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          Expanded(
                              flex: 2, child: heading(text: "Discharge Date")),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: KTextFormField(
                              controller: _dischargeDatecontroller,
                              hintText: "Enter Discharge Date",
                           //   validation: (value) => validateID(value),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          Expanded(
                              flex: 2, child: heading(text: "Patient Status")),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: KTextFormField(
                              controller: _patientStatuscontroller,
                              hintText: "Enter Patient Status",
                           //   validation: (value) => validateID(value),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.02),
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
    if (_hospitalpatientKey.currentState!.validate()) {
      _hospitalpatientKey.currentState!.save();
      hospitalpatient();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Patient Details Submitted')));
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => SearchHospital()));
    }
  } 
  

 Future<dynamic> hospitalpatient() async {
    var headers = {
      'Content-Type': 'application/json',
     'Cookie': 'access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJOb29iQ29kZXIiLCJzdWIiOiI2MGM3NTBmZWZhYjk1ZDAwMTU1NTM4ZTciLCJpYXQiOjE2MjM4NDU1ODcsImV4cCI6MTYyMzg0OTE4N30.l_8sYqlAVMtykFQPZkZeEXXby92jeT6YSj-ScwZpOLc'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://covid-dash-combined.herokuapp.com/hospital/stats/patientdetails'));
    request.body =
        '''{\r\n"username": "${_usernamecontroller.text}",\r\n    "Patient_Name": "${_patientNamecontroller.text}",\r\n    "Patient_Id": ${int.parse(_patientIDcontroller.text)},\r\n    "Age": ${int.parse(_patientAgecontroller.text)},\r\n    "Adhar_Number": ${int.parse(_aadharcontroller.text)},\r\n    "Date_of_admission": "${_admissionDatecontroller.text}",\r\n    "Admission_detail": "${_admissionDetailscontroller.text}",\r\n    "Discharge_Date": "${_dischargeDatecontroller.text}",\r\n   "Patient_Status": "${_patientStatuscontroller.text}"\r\n}''';
    request.headers.addAll(headers);
    print(request.body);
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


