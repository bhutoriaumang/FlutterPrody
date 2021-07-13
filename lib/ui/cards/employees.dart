import 'package:flutter/material.dart';
import 'package:prody/shared/constants.dart';
import 'package:prody/ui/screens/home.dart';

import 'employee_detail.dart';

// ignore: must_be_immutable
class EmployeesProjectList extends StatefulWidget {
  List members, selected, unselected;
  EmployeesProjectList({this.members, this.selected, this.unselected});
  @override
  _EmployeesProjectListState createState() => _EmployeesProjectListState();
}

class _EmployeesProjectListState extends State<EmployeesProjectList> {
  Widget getDetails(BuildContext context, String uid) => Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
      child: EmployeeDetail(
        uid: uid,
        designation: "Member",
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Project",
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
                Navigator.of(context).push(createRoute4(widget.selected));
              },
              icon: Icon(
                Icons.create_rounded,
                color: tertiaryColor,
              ),
              label: Text(
                "Create",
                style: TextStyle(color: tertiaryColor),
              ),
            ),
          )
        ],
      ),
      backgroundColor: secondaryColor,
      body: ListView.builder(
          itemCount:
              1 + widget.unselected.length + 1 + widget.selected.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0)
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  "Employees Left :-",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      fontWeight: FontWeight.bold),
                ),
              );
            else if (index <= (widget.unselected.length)) {
              return ListTile(
                onTap: () {
                  var temp = widget.unselected[index - 1];
                  widget.unselected.remove(temp);
                  widget.selected.add(temp);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget));
                },
                title: getDetails(context, widget.unselected[index - 1]),
              );
            } else if (index == (1 + widget.unselected.length))
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  "Selected Employees :-",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      fontWeight: FontWeight.bold),
                ),
              );
            else {
              return ListTile(
                onTap: () {
                  var temp =
                      widget.selected[index - 2 - widget.unselected.length];
                  widget.selected.remove(temp);
                  widget.unselected.add(temp);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget));
                },
                title: getDetails(context,
                    widget.selected[index - 2 - widget.unselected.length]),
              );
            }
          }),
    );
  }
}
