import 'package:flutter/material.dart';
import 'package:prody/ui/home.dart';
import 'package:prody/ui/personalinfo.dart';
import 'package:prody/ui/piechart.dart';

class ProjectList extends StatelessWidget {
  final Color primarycolor = Color.fromRGBO(5, 68, 94, 1);
  final Color secondarycolor = Color.fromRGBO(24, 154, 180, 1);
  final Color tertiarycolor = Color.fromRGBO(212, 241, 244, 1);

  Widget cards() {
    return ListView.builder(
      itemCount: 10 + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index != 0) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: ProjectCard(),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: PersonalInfo(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "ProDy",
                style: TextStyle(
                    color: tertiarycolor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              toolbarHeight: 80,
              backgroundColor: secondarycolor,
            ),
            backgroundColor: secondarycolor,
            body: cards()));
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
  final Color primarycolor = Color.fromRGBO(5, 68, 94, 1);
  final Color secondarycolor = Color.fromRGBO(24, 154, 180, 1);
  final Color tertiarycolor = Color.fromRGBO(212, 241, 244, 1);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.38,
      decoration: BoxDecoration(
          color: tertiarycolor, borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Icon(
                Icons.web,
                color: primarycolor,
                size: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 60),
                child: Container(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Project 1",
                        style: TextStyle(
                          color: primarycolor,
                          fontSize: 20,
                        ),
                      ),
                      Text.rich(TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          children: [
                            TextSpan(
                              text: "Project Details",
                            ),
                          ]))
                    ],
                  ),
                ),
              ),
              PieChart2(
                completed: 0.75,
              ),
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
