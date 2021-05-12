import 'package:flutter/material.dart';
import 'package:prody/services/auth.dart';
import 'package:prody/ui/home.dart';
import 'package:prody/ui/personalinfo.dart';
import 'package:prody/ui/piechart.dart';
import 'package:prody/shared/constants.dart';

class ProjectList extends StatelessWidget {
  final AuthService _auth = AuthService();

  Widget cards() {
    return ListView.builder(
      itemCount: 10 + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index != 0) {
          return Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Container(
              child: ProjectCard(),
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.05),
            child: PersonalInfo(),
          );
        }
      },
    );
  }

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
          actions: [
            // ignore: deprecated_member_use
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text("logout"))
          ],
        ),
        backgroundColor: secondarycolor,
        body: cards());
  }
}

Route createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ProDyHome(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 2.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class ProjectCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.38,
      decoration: BoxDecoration(
          color: tertiarycolor, borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  Icons.web,
                  color: primarycolor,
                  size: MediaQuery.of(context).size.width * 0.15,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Project 1",
                        maxLines: 1,
                        style: TextStyle(
                          color: primarycolor,
                          fontSize: 20,
                        ),
                      ),
                      Text("Project Detailsded2d2d\n\n\newk\nn",
                        maxLines: 4,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Expanded(
                child: PieChart2(
                completed: 0.75,
              ),)
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(createRoute());
        },
      ),
    );
  }
}