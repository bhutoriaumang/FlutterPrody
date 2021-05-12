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

  List<Widget> teammembers() {
    List<Text> memb = [];

    for (int i = 0; i < members.length; i++) {
      memb.add(Text(
        "\u2022" + members[i],
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, color: primarycolor),
      ));
    }

    return memb;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 12),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Text(
                    field,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: primarycolor),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ] +
                teammembers(),
          ),
        ]),
      ),
    );
  }
}
