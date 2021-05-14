import 'package:flutter/material.dart';
import 'package:prody/services/auth.dart';
import 'package:prody/shared/constants.dart';
import 'package:prody/ui/screens/profile.dart';
import 'package:prody/ui/screens/project_info.dart';
import 'package:prody/ui/cards/personalinfo.dart';
import 'package:prody/ui/cards/piechart.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
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
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.001),
              child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(createRoute2());
                  },
                  icon: Icon(
                    Icons.person,
                    color: tertiaryColor,
                  ),
                  label: Text(
                    "profile",
                    style: TextStyle(color: tertiaryColor),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.001),
              child: TextButton.icon(
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  icon: Icon(
                    Icons.exit_to_app_outlined,
                    color: tertiaryColor,
                  ),
                  label: Text(
                    "logout",
                    style: TextStyle(color: tertiaryColor),
                  )),
            ),
          ],
        ),
        backgroundColor: secondaryColor,
        body: cards());
  }
}

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
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.05),
          child: PersonalInfo(),
        );
      }
    },
  );
}

Route createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ProjectInfo(),
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

Route createRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Profile(),
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
      height: MediaQuery.of(context).size.height * 0.18,
      decoration: BoxDecoration(
          color: tertiaryColor, borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  Icons.web,
                  color: primaryColor,
                  size: MediaQuery.of(context).size.width * 0.17,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.15),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Project 1",
                          maxLines: 1,
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),
                        Text(
                          "Project Details",
                          maxLines: 4,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PieChart2(
                  completed: 0.75,
                ),
              )
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
