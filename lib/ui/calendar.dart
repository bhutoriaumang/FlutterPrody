import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  final Map<String, bool> deadlines = {
    "Initial meeting": true,
    "Design choices": true,
    "Meet on fnializing design": true,
    "Assignment of employees": true,
    "First project submisssion deadline": false,
    "Second project submission deadline": false,
    "Final projeect submission deadline": false
  };

  final Color primarycolor = Color.fromRGBO(5, 68, 94, 1);
  final Color secondarycolor = Color.fromRGBO(24, 154, 180, 1);
  final Color tertiarycolor = Color.fromRGBO(212, 241, 244, 1);

  List<Widget> deadlinesfunc() {
    List<Widget> column = [];
    for (int i = 0; i < 7; i++) {
      if (deadlines.values.elementAt(i) == true) {
        column.add(Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            "\u2022" + deadlines.keys.elementAt(i),
            style: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w300),
          ),
        ));
      } else {
        column.add(Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            "\u2022" + deadlines.keys.elementAt(i),
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ));
      }
    }
    return column;
  }

  Text nextDeadline() {
    for (int i = 0; i < 7; i++) {
      if (deadlines.values.elementAt(i) == false)
        return Text(
          deadlines.keys.elementAt(i),
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: primarycolor),
        );
    }
    return Text(
      "No Upcoming deadlines",
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: primarycolor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Deadlines :",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primarycolor),
                ),
                SizedBox(
                  height: 20,
                ),
                nextDeadline(),
              ]),
        ),
      ),
    );
  }
}
