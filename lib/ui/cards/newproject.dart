import 'package:flutter/material.dart';
import '../../shared/constants.dart';
import '../screens/home.dart';

class NewProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
          color: tertiaryColor, borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        child: Center(
          child: Text(
            "New Project",
            style: TextStyle(
                fontSize: 30, color: primaryColor, fontWeight: FontWeight.w500),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(createRoute3());
        },
      ),
    );
  }
}
