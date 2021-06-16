import 'package:flutter/material.dart';
import 'package:uoodmaish_hospital_user/screens/public_view/hospitals.dart';
import 'package:uoodmaish_hospital_user/utils/strings.dart';
import 'package:uoodmaish_hospital_user/widgets/kdropdownfield.dart';

import '../../constants.dart';
import '../../widgets/index.dart';

class SearchHospital extends StatefulWidget {
  @override
  _SearchHospitalState createState() => _SearchHospitalState();
}

class _SearchHospitalState extends State<SearchHospital> {
  final _searchHospitalKey = GlobalKey<FormState>();
  String? _state;
  String? _country;
  String? _district;
  String? _area;
  String? _ward;
  bool searchNearBy = true;

  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: gOIAppBar(context),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _searchHospitalKey,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: mwidth * 0.10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  heading(text: "Select your Country"),
                  FormDropdown(
                    hintText: _country ?? "select country",
                    itemList: listOfCountry,
                    onSaved: (String? value) => _country = value,
                    onChanged: (String? value) {},
                  ),
                  heading(text: "Select your State"),
                  FormDropdown(
                    hintText: _state ?? "select State",
                    itemList: listOfStates,
                    onSaved: (String? value) => _state = value,
                    onChanged: (String? value) {},
                  ),
                  heading(text: "Select your District"),
                  FormDropdown(
                    hintText: _district ?? "select District",
                    itemList: listOfStates,
                    onSaved: (String? value) => _district = value,
                    onChanged: (String? value) {},
                  ),
                  heading(text: "Select your Area"),
                  FormDropdown(
                    hintText: _area ?? "select area",
                    itemList: listOfStates,
                    onSaved: (String? value) => _area = value,
                    onChanged: (String? value) {},
                  ),
                  heading(text: "Select your ward/Sector/Landmark"),
                  FormDropdown(
                    hintText: _ward ?? "select landmark",
                    itemList: listOfStates,
                    onSaved: (String? value) => _ward = value,
                    onChanged: (String? value) {},
                  ),
                  _searchNearBy(),
                  SizedBox(
                    height: 10,
                  ),
                  Center(child: Text("OR")),
                  SizedBox(
                    height: 10,
                  ),
                  _detectLoc(),
                  SizedBox(
                    height: 10,
                  ),
                  CommonButton(
                    text: "Search for Hospital",
                    onPressed: () => _onSubmit(context),
                    color: Color(0xffBD9F1A),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchNearBy() {
    return Row(
      children: <Widget>[
        Checkbox(
          checkColor: Colors.white,
          activeColor: primaryColor,
          value: searchNearBy,
          onChanged: (value) {
            setState(() {
              searchNearBy = value!;
            });
          },
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Search for nearby hospitals',
        ),
      ],
    );
  }

  Widget _detectLoc() {
    return Center(
      child: TextButton.icon(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            foregroundColor: MaterialStateProperty.all(primaryColor),
          ),
          onPressed: () {},
          icon: Icon(Icons.location_searching),
          label: Text("Detect location")),
    );
  }

  void _onSubmit(context) {
    if (_searchHospitalKey.currentState!.validate()) {
      _searchHospitalKey.currentState!.save();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Searching...')));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Hospitals()));
    }
  }
}
