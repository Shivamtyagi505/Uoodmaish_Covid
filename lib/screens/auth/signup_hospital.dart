import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uoodmaish_hospital_user/screens/hospital_basicDetails/hospital_basic.dart';
import 'package:uoodmaish_hospital_user/utils/validators.dart';
import 'package:uoodmaish_hospital_user/widgets/index.dart';
import 'package:uoodmaish_hospital_user/widgets/widgets.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;

class SignUpAsHospital extends StatefulWidget {
  @override
  _SignUpAsHospitalState createState() => _SignUpAsHospitalState();
}

class _SignUpAsHospitalState extends State<SignUpAsHospital> {
  final _hospitalSignUpKey = GlobalKey<FormState>();

  TextEditingController _hospitalnamecontroller = TextEditingController();
  TextEditingController _contactcontroller = TextEditingController();
  TextEditingController _licensecontroller = TextEditingController();
  TextEditingController _registerationcontroller = TextEditingController();
  TextEditingController _addresscontroller = TextEditingController();
  TextEditingController _citycontroller = TextEditingController();
  TextEditingController _statecontroller = TextEditingController();
  TextEditingController _pincodecontroller = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();
  TextEditingController _usernamecontroller = TextEditingController();

  List<String> _hospitalTypes = ["Government", "Private"];

  String hospitalTypeField = "Government";

  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: gOIAppBar(context),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Text(
                  "Signup as Hospital",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Form(
              key: _hospitalSignUpKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: mwidth * 0.05),
                padding: EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                    color: backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KTextFormField(
                      controller: _usernamecontroller,
                      hintText: "User Name",
                      validation: (value) => validateNames(value),
                    ),
                    KTextFormField(
                      controller: _passcontroller,
                      hintText: "Password",
                      validation: (value) => validateNames(value),
                    ),
                    KTextFormField(
                      controller: _hospitalnamecontroller,
                      hintText: "Hospital Name",
                      validation: (value) => validateNames(value),
                    ),
                    KTextFormField(
                      controller: _contactcontroller,
                      hintText: "Enter Contact number",
                      validation: (value) => validateMobile(value),
                    ),
                    KTextFormField(
                      controller: _licensecontroller,
                      hintText: "Enter License number",
                      validation: (value) => validateMobile(value),
                    ),
                    KTextFormField(
                      controller: _registerationcontroller,
                      hintText: "Enter Registeration number",
                      validation: (value) => validateMobile(value),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: dropdownContainer(
                          value: hospitalTypeField,
                          onChanged: (value) => setState(() {
                                hospitalTypeField = value;
                              }),
                          items: _hospitalTypes),
                    ),
                    KTextFormField(
                      controller: _addresscontroller,
                      hintText: "Enter address",
                      validation: (value) => validateNames(value),
                    ),
                    KTextFormField(
                      controller: _citycontroller,
                      hintText: "Enter city",
                      validation: (value) => validateNames(value),
                    ),
                    KTextFormField(
                      controller: _statecontroller,
                      hintText: "Enter state",
                      validation: (value) => validateNames(value),
                    ),
                    KTextFormField(
                      controller: _pincodecontroller,
                      hintText: "Enter pincode",
                      validation: (value) => validatePincode(value),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: KTextFormField(
                            hintText: "Captcha",
                          ),
                        ),
                        Expanded(
                          child: _captacha(),
                        ),
                      ],
                    ),
                    Center(
                      child: CommonButton(
                        text: "Sign up",
                        onPressed: () => _onSubmit(context),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        )),
      ),
    );
  }

  void _onSubmit(context) {
    if (_hospitalSignUpKey.currentState!.validate()) {
      _hospitalSignUpKey.currentState!.save();
      hospitalSignup();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('OKAY')));
    }
  }

  Widget _captacha() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
      height: 55,
      decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
            ),
          ],
          borderRadius: BorderRadius.circular(2)),
      child: Center(child: Text("T X 1Ac")),
    );
  }

  Future<dynamic> hospitalSignup() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://covid-dash-combined.herokuapp.com/hospital/user/signup'));
    request.body =
        '''{"Hospital_Type":"${hospitalTypeField}","username":"${_usernamecontroller.text}","Hospital_Name":"${_hospitalnamecontroller.text}","password":"${_passcontroller.text}","Contact_Number":"${_contactcontroller.text}","License_Number":"${_licensecontroller.text}","Registration_Number":${_registerationcontroller.text},"Address":"${_addresscontroller.text}","City":"${_citycontroller.text}","State":"${_statecontroller.text}","Pincode":${int.parse(_pincodecontroller.text)}\r\n}''';
    request.headers.addAll(headers);
    print(request.body);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String res = await response.stream.bytesToString();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
      if (res == "Created") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HospitalBasicDetails()));
      }
    } else {
      print(response.reasonPhrase);
    }
  }
}
