import 'package:flutter/material.dart';

import '../constants.dart';

Widget txtfieldContainer(
    Widget child, Text hintText, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      decoration: BoxDecoration(
        color: Color(0XFFE4E4E4),
      ),
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: txtField(hintTxt: hintText, controller: controller)),
    ),
  );
}

Widget txtField(
    {required hintTxt,
    int maxLine = 1,
    bool obscure = false,
    required TextEditingController controller}) {
  return TextFormField(
    controller: controller,
    style: TextStyle(fontSize: 20),
    minLines: 1,
    maxLines: maxLine,
    obscureText: obscure,
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintTxt,
        hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Color(0xFF3D3D3D),
            fontSize: 20)),
  );
}

class KTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscure;
  final Function(String?)? onSaved;
  final validation;
  final height ;

  const KTextFormField(
      {Key? key,
      this.controller,
      this.hintText,
      this.obscure = false,
      this.onSaved,
      this.height,
      this.validation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
        margin: const EdgeInsets.all(defaultPadding),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
              controller: controller,
              style: TextStyle(fontSize: 15),
              onSaved: onSaved,
              obscureText: obscure,
              validator: validation,
              decoration: inputDecoration.copyWith(
                hintText: hintText,
              )),
        ));
  }
}
