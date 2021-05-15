import 'package:flutter/material.dart';
import 'package:prody/shared/constants.dart';
import 'package:prody/ui/cards/employee_detail.dart';

class TeamMembersInfo extends StatelessWidget {
  final List members;
  final String team;

  TeamMembersInfo({@required this.members, @required this.team});

  Widget getDetails(BuildContext context, String uid) => Padding(
    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04 ),
      child: EmployeeDetail(uid: uid, designation: "Member",));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Design Team",
            style: TextStyle(
                color: tertiaryColor,
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .width * 0.07,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          toolbarHeight: MediaQuery
              .of(context)
              .size
              .height * 0.08,
          backgroundColor: secondaryColor,
        ),
        backgroundColor: secondaryColor,
        body: ListView(
          children: members.map((uid) => getDetails(context, uid)).toList(),
        )
    );
  }
}
