import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 2.0
        )
      ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.white,
          width: 2.0
      )
  ),
);

const Color primaryColor = Color.fromRGBO(5, 68, 94, 1);
const Color secondaryColor = Color.fromRGBO(24, 154, 180, 1);
const Color tertiaryColor = Color.fromRGBO(212, 241, 244, 1);