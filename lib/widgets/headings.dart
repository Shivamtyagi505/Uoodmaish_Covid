import 'package:flutter/material.dart';

Padding heading(
    {String text = "",
    Color color = Colors.black,
    TextDecoration textDecoration = TextDecoration.none,
    FontWeight weight = FontWeight.w700,
    TextAlign align = TextAlign.center,
    double scale = 1}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text("$text",
        overflow: TextOverflow.ellipsis,
        textAlign: align,
        maxLines: 5,
        textScaleFactor: scale,
        style: TextStyle(
            decoration: textDecoration, color: color, fontWeight: weight)),
  );
}
