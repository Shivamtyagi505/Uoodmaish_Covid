import 'package:flutter/material.dart';
import 'package:uoodmaish_hospital_user/utils/validators.dart';
import 'package:uoodmaish_hospital_user/widgets/index.dart';

import '../../constants.dart';

// ignore: must_be_immutable
class SignUpAsGov extends StatelessWidget {
  final _govSignUpKey = GlobalKey<FormState>();
  TextEditingController _passcontroller = TextEditingController();
  TextEditingController _cpasscontroller = TextEditingController();
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
                  "Signup as Government",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Form(
              key: _govSignUpKey,
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
                    Row(
                      children: [
                        Expanded(
                          child: KTextFormField(
                            hintText: "First name",
                            validation: (value) => validateNames(value),
                          ),
                        ),
                        Expanded(
                          child: KTextFormField(
                            hintText: "Last name",
                            validation: (value) => validateNames(value),
                          ),
                        ),
                      ],
                    ),
                    KTextFormField(
                      hintText: "Enter Corporate mail address",
                      validation: (value) => validateEmail(value),
                    ),
                    KTextFormField(
                      hintText: "Set password",
                      validation: (value) => validatePassword(value),
                      controller: _passcontroller,
                    ),
                    KTextFormField(
                        hintText: "Confirm password",
                        controller: _cpasscontroller,
                        validation: (value) {
                          if (value == null) {
                            return "Please Re-Enter New Password.";
                          } else if (value != _passcontroller.text) {
                            return "Password does not match.";
                          }
                        }),
                    KTextFormField(
                      hintText: "Enter Designation",
                      validation: (value) => validateNames(value),
                    ),
                    KTextFormField(
                      hintText: "Enter Department name",
                      validation: (value) => validateNames(value),
                    ),
                    KTextFormField(
                      hintText: "Enter Employee code",
                      validation: (value) => validateID(value),
                    ),
                    KTextFormField(
                      hintText: "Office address",
                      validation: (value) => validateNames(value),
                    ),
                    KTextFormField(
                      hintText: "Enter city",
                      validation: (value) => validateNames(value),
                    ),
                    KTextFormField(
                      hintText: "Enter state",
                      validation: (value) => validateNames(value),
                    ),
                    KTextFormField(
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
    if (_govSignUpKey.currentState!.validate()) {
      _govSignUpKey.currentState!.save();
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
}
