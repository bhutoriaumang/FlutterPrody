// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prody/ui/teammembers.dart';
import 'calendar.dart';
import 'deadlinegraph.dart';
import 'piechart.dart';
import 'package:prody/shared/constants.dart';

class ProDyHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ProDy",
          style: TextStyle(
              color: tertiarycolor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        backgroundColor: secondarycolor,
      ),
      backgroundColor: secondarycolor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08),
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.05, top: MediaQuery.of(context).size.width * 0.1),
            child: ProjectLead(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.05),
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
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProDyCard(
                  field: "Card 3",
                ),
                ProDyCard(
                  field: "Card 4",
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05, bottom: MediaQuery.of(context).size.width * 0.1),
            child: LineChartSample1(),
          ),
        ]),
      ),
    );
  }
}

class ProDyCard extends StatelessWidget {
  final String field;

  ProDyCard({this.field});

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
        members: [
          "Arnav Bhargava",
          "Umang Bhutoria",
          "Tanmay Ghodeshwar",
          "Madhur",
          "Adeel",
          "Maulik Bahri"
        ],
      );
    else if (field == "Card 4")
      return TeamMembers(
        field: "Web Team",
        members: [
          "Arnav Bhargava",
          "Umang Bhutoria",
          "Tanmay Ghodeshwar",
          "Maulik Bahri"
        ],
      );
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.4,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: tertiarycolor,
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

class ProjectLead extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.4,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: tertiarycolor,
        elevation: 10,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.person,
                      color: primarycolor,
                      size: MediaQuery.of(context).size.width * 0.3,
                    ),
                    radius: MediaQuery.of(context).size.width * 0.15,
                    backgroundColor: tertiarycolor,
                  ),
                  Text(
                    "Project Lead",
                    style: TextStyle(
                        color: primarycolor,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.person_add_alt_1_outlined,
                            color: primarycolor,
                          ),
                          Container(
                            child: Text(
                              "Umang Bhutoria",
                              style: TextStyle(
                                  color: primarycolor,
                                  fontSize: MediaQuery.of(context).size.width * 0.025,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.phone,
                          color: primarycolor,
                        ),
                        Text(
                          "6290340456",
                          style: TextStyle(
                              color: primarycolor,
                              fontSize: MediaQuery.of(context).size.width * 0.025,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.email,
                          color: primarycolor,
                        ),
                        Container(
                          child: Text(
                            "bhutoriaumang@gmail.com",
                            style: TextStyle(
                                color: primarycolor,
                                fontSize: MediaQuery.of(context).size.width * 0.025,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.alternate_email,
                          color: primarycolor,
                        ),
                        Container(
                          child: Text(
                            "Umang@linkedIn.com",
                            style: TextStyle(
                                color: primarycolor,
                                fontSize: MediaQuery.of(context).size.width * 0.025,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                ],
              ),
            ],
          ),
      ),
    );
  }
}
