// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prody/models/CurrentUser.dart';
import 'package:prody/models/project.dart';
import 'package:prody/shared/constants.dart';
import 'package:prody/ui/cards/employee_detail.dart';
import 'package:prody/ui/cards/teamMembers.dart';
import 'package:prody/ui/screens/teamMembersInfo.dart';
import 'package:provider/provider.dart';

import '../cards/calendar.dart';
import '../cards/deadlinegraph.dart';
import '../cards/piechart.dart';

class ProjectInfo extends StatelessWidget {
  final Project project;
  ProjectInfo(this.project);

  @override
  Widget build(BuildContext context) {

    final _employee = Provider.of<Employee>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ProDy",
          style: TextStyle(
              color: tertiaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.07,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        backgroundColor: secondaryColor,
      ),
      backgroundColor: secondaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.02,
                top: MediaQuery.of(context).size.height * 0.04),
            child: EmployeeDetail(uid: _employee.uid, designation: "Project Lead"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProDyCard(
                  field: "Card 1",
                ),
                ProDyCard(
                  field: "Card 2",
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: ProDyCard(
                    field: "Card 3",
                    members: project.designTeam,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TeamMembersInfo(members: project.designTeam, team: "Design Team",)));
                  },
                ),
                GestureDetector(
                  child: ProDyCard(
                    field: "Card 4",
                    members: project.webTeam,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TeamMembersInfo(members: project.webTeam, team: "Web Team")));
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.04),
            child: LineChartSample1(),
          ),
        ]),
      ),
    );
  }
}

class ProDyCard extends StatelessWidget {
  final String field;
  final List members;

  ProDyCard({this.field, this.members});

  Widget cardType() {
    if (field == "Card 1")
      return PieChart3(
        completed: 0.75,
      );
    else if (field == "Card 2")
      return Calendar();
    else if (field == "Card 3")
      return TeamMembers(
        field: "Design Team",
        members: members,
      );
    else if (field == "Card 4")
      return TeamMembers(
        field: "Web Team",
        members: members,
      );
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: tertiaryColor,
        elevation: 10,
        child: Center(
          child: ListTile(
            title: Center(
              child: cardType(),
            ),
            minLeadingWidth: MediaQuery.of(context).size.width * 0.15,
          ),
        ),
      ),
    );
  }
}