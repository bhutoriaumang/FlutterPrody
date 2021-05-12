import 'package:flutter/material.dart';
import 'package:prody/shared/constants.dart';

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

  List<Widget> deadlinesfunc() {
    List<Widget> column = [];
    for (int i = 0; i < 7; i++) {
      if (deadlines.values.elementAt(i) == true) {
        column.add(Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            "\u2022" + deadlines.keys.elementAt(i),
            style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight:
                FontWeight.w300),
          ),
        ));
      } else {
        column.add(Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            "\u2022" + deadlines.keys.elementAt(i),
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400
            ),
          ),
        ));
      }
    }
    return column;
  }

  Text nextDeadline(BuildContext context) {
    for (int i = 0; i < 7; i++) {
      if (deadlines.values.elementAt(i) == false)
        return Text(
          deadlines.keys.elementAt(i),
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.w500,
              color: primarycolor
          ),
        );
    }
    return Text(
      "No Upcoming deadlines",
      style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.04,
          fontWeight: FontWeight.w500,
          color: primarycolor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Deadlines :",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontWeight: FontWeight.bold,
                  color: primarycolor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            nextDeadline(context),
          ]),
    );
  }
}