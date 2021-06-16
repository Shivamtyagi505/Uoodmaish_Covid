import 'package:flutter/material.dart';
import 'package:uoodmaish_hospital_user/constants.dart';

class FormDropdown extends StatelessWidget {
  final GlobalKey? fdropdownkey;
  final String? hintText;
  final onChanged;
  final onSaved;
  final List<String>? itemList;

  const FormDropdown(
      {Key? key,
      this.fdropdownkey,
      this.hintText,
      this.onChanged,
      this.itemList,
      this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonFormField(
          items: itemList?.map<DropdownMenuItem<String>>((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: Text(
            hintText!,
          ),
          onSaved: onSaved,
          onChanged: onChanged,
          validator: (value) =>
              value == null ? 'This field is required !' : null,
          isDense: true,
          dropdownColor: dropDownContainerColor,
          decoration: inputDecoration),
    );
  }
}
