import 'package:flutter/material.dart';
import 'package:prody/shared/constants.dart';

import 'employee_detail.dart';

class EmployeesProjectList extends StatefulWidget {
  List members;
  EmployeesProjectList({this.members});
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
      ),
      backgroundColor: secondaryColor,
      body: ListView.builder(
          itemCount: widget.members.length,
          itemBuilder: (BuildContext context, int index) {
            if (index != 0 || (index == 0 && f == 1)) {
              return ListTile(
                onTap: () {
                  print(f);
                  f = -f;
                  print(f);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget));
                },
                title: getDetails(context, widget.members[index]),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
