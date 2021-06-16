import 'package:flutter/material.dart';
import 'package:uoodmaish_hospital_user/constants.dart';

Widget dropdownContainer(
    {required String value, onChanged, required List<String> items}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Container(
      decoration: BoxDecoration(
          color: dropDownContainerColor,
          borderRadius: BorderRadius.circular(3)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButton<String>(
          value: value,
          underline: SizedBox(),
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 0,
          focusColor: Colors.orange,
          dropdownColor: dropDownContainerColor,
          isExpanded: true,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 17),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    ),
  );
}
