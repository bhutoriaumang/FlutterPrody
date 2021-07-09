import 'package:flutter/material.dart';
import 'package:prody/ui/cards/employeeslist.dart';
import 'package:provider/provider.dart';

import '../../models/CurrentUser.dart';
import '../../services/database.dart';
import '../../shared/constants.dart';

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
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
      body: StreamProvider<List<Employee>>.value(
        initialData: null,
        value: DatabaseService().employees,
        child: EmployeesList(),
      ),
    );
  }
}
