import 'package:flutter/material.dart';
import 'package:uoodmaish_hospital_user/constants.dart';

Widget backArrowBtn(BuildContext context) {
  return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ));
}

Widget primarycolorButton(String btnTxt) {
  return Container(
    decoration: BoxDecoration(color: primaryColor),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(
          btnTxt,
          textScaleFactor: 1,
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    ),
  );
}

Widget goldenBorderButton(String btnTxt) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFBD9F1A), width: 2)),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(
          btnTxt,
          textScaleFactor: 1,
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
    ),
  );
}

Widget goldenButton(String btnTxt) {
  return Container(
    decoration: BoxDecoration(color: Color(0xFFBD9F1A)),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Text(
          btnTxt,
          textScaleFactor: 1,
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    ),
  );
}

class CommonButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final Color? color;

  const CommonButton({Key? key, this.text = "Okay", this.onPressed, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
            backgroundColor: MaterialStateProperty.all(color ?? primaryColor)),
        onPressed: onPressed,
        child: Text("$text",
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));
  }
}
