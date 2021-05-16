import 'package:flutter/material.dart';
import 'package:prody/services/database.dart';
import 'package:prody/shared/constants.dart';

class TeamMembers extends StatelessWidget {
  final List members;
  final String field;

  TeamMembers({this.field, this.members});

  List<Widget> teamMembers(BuildContext context) {
    List<Widget> memberNames = [];

    for (int i = 0; i < members.length; i++) {
      DatabaseService _database = DatabaseService(uid: members[i]);
      memberNames.add(FutureBuilder(
          future: _database.employee(),
          builder: (context, snapshot) {
            if (snapshot.data != null)
              return Text(
                "\u2022" + snapshot.data.name,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.033,
                    fontWeight: FontWeight.w500,
                    color: primaryColor),
              );
            else
              return Container();
          }));
    }

    return memberNames;
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
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.013,
                  )
                ] +
                teamMembers(context),
          ),
        ]),
      ),
    );
  }
}
