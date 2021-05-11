// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prody/ui/teammembers.dart';
import 'piechart.dart';
import 'calendar.dart';
import 'deadlinegraph.dart';

class ProDyHome extends StatelessWidget {
  final Color primarycolor = Color.fromRGBO(5, 68, 94, 1);
  final Color secondarycolor = Color.fromRGBO(24, 154, 180, 1);
  final Color tertiarycolor = Color.fromRGBO(212, 241, 244, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ProDy",
          style: TextStyle(
            color: tertiarycolor,
            fontSize: 30,
          ),
        ),
        backgroundColor: secondarycolor,
        toolbarHeight: 70,
      ),
      backgroundColor: secondarycolor,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 40),
                  child: ProjectLead(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                  padding: const EdgeInsets.only(top: 20.0),
                  child: LineChartSample1(),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class ProDyCard extends StatelessWidget {
  final String field;
  final Color primarycolor = Color.fromRGBO(240, 235, 204, 1);
  final Color secondarycolor = Color.fromRGBO(24, 154, 180, 1);
  final Color tertiarycolor = Color.fromRGBO(212, 241, 244, 1);

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
    else
      return LineChartSample1();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.38,
      height: MediaQuery.of(context).size.width * 0.38,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: tertiarycolor,
        elevation: 10,
        margin: EdgeInsets.all(0),
        child: Center(
          child: ListTile(
            title: Center(
              child: cardType(),
            ),
            minLeadingWidth: 60,
          ),
        ),
      ),
    );
  }
}

class ProjectLead extends StatelessWidget {
  final Color primarycolor = Color.fromRGBO(5, 68, 94, 1);
  final Color secondarycolor = Color.fromRGBO(24, 154, 180, 1);
  final Color tertiarycolor = Color.fromRGBO(212, 241, 244, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.38,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: tertiarycolor,
        elevation: 10,
        margin: EdgeInsets.all(0),
        child: Center(
          child: ListTile(
            title: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          color: primarycolor,
                          size: 120,
                        ),
                        radius: 60,
                        backgroundColor: tertiarycolor,
                      ),
                      Text(
                        "Project Lead",
                        style: TextStyle(
                            color: primarycolor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 00.0),
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
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: Row(
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
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: Row(
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
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 00.0),
                        child: Row(
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
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            minLeadingWidth: 60,
          ),
        ),
      ),
    );
  }
}
