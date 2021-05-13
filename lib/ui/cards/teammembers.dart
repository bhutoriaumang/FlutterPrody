import 'package:flutter/material.dart';
import 'package:prody/shared/constants.dart';

class TeamMembers extends StatelessWidget {
  //   "Arnav Bhargava",
  //   "Umang Bhutoria",
  //   "Tanmay Ghodeshwar",
  //   "Madhur",
  //   "Adeel",
  //   "Maulik Bahri"
  // ];

  final List members;
  final String field;

  TeamMembers({this.field, this.members});

  List<Widget> teammembers(BuildContext context) {
    List<Text> memb = [];

    for (int i = 0; i < members.length; i++) {
      memb.add(Text(
        "\u2022" + members[i],
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontWeight: FontWeight.w500,
            color: primaryColor),
      ));
    }

    return memb;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.015),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Text(
                    field,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  )
                ] +
                teammembers(context),
          ),
        ]),
      ),
    );
  }
}
