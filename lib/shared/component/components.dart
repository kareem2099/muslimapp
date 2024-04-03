
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required Function() function,
  required String text,
  bool isUpperCase = true,
  double radius = 30.0,
}) =>
    Container(
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color:  const Color(0xff9e672f),
      ),
      child: MaterialButton(
        onPressed: function,
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none
        ),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
              color: Color(0xff1894f3),
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
      ),
    );
