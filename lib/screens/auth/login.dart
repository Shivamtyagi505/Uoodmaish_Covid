import 'package:flutter/material.dart';
import 'package:uoodmaish_hospital_user/screens/auth/sign_up_as.dart';
import 'package:uoodmaish_hospital_user/screens/hospital_basicDetails/hospital_basic.dart';
import 'package:uoodmaish_hospital_user/utils/validators.dart';
import 'package:uoodmaish_hospital_user/widgets/index.dart';
import 'package:http/http.dart' as http;
import '../../constants.dart';

class LoginPage extends StatelessWidget {
  final _loginFormKey = GlobalKey<FormState>();
  TextEditingController _passcontroller = TextEditingController();
  TextEditingController _usernamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: gOIAppBar(context),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Form(
              key: _loginFormKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: mwidth * 0.10),
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
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Login",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    KTextFormField(
                      controller: _usernamecontroller,
                      hintText: "Enter User Name",
                      // validation: (value) => validateID(value),
                    ),
                    KTextFormField(
                      controller: _passcontroller,
                      hintText: "Enter your password",
                      validation: (value) => validatePassword(value),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Text(
                        "Forgot password",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
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
                        text: "Login",
                        onPressed: () => _onSubmit(context),
                      ),
                    )
                  ],
                ),
              ),
            ),
            _signUpTextButton(context)
          ],
        )),
      ),
    );
  }

  Widget _signUpTextButton(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpAs())),
        child: Text(
          "Sign up",
          style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.normal,
              fontSize: 18,
              decoration: TextDecoration.underline),
        ));
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

  void _onSubmit(context) {
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();
      login();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HospitalBasicDetails()));
      //  ScaffoldMessenger.of(context)
      //    .showSnackBar(SnackBar(content: Text('OKAY')));
    }
  }

  Future<dynamic> login() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJOb29iQ29kZXIiLCJzdWIiOiI2MGM3NDdjOWNlYThjNTAwMTU5MzBiYjYiLCJpYXQiOjE2MjM2NzMxNTEsImV4cCI6MTYyMzY3Njc1MX0.uUEC86CizU-t3m8OzaxsWrMijRUgjq9bGfrT00DaMeM'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://covid-dash-combined.herokuapp.com/hospital/user/login'));
    request.body =
        '''{"username":"${_usernamecontroller.text}","password":"${_passcontroller.text}"}''';
    request.headers.addAll(headers);
    print(request.body);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
