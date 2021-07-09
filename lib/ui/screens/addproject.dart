import 'package:flutter/material.dart';
import 'package:prody/ui/cards/employeeslist.dart';
import 'package:provider/provider.dart';

import '../../models/CurrentUser.dart';
import '../../services/database.dart';

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  @override
  Widget build(BuildContext context) {
    EmployeesList cards = EmployeesList();
    return StreamProvider<List<Employee>>.value(
      initialData: null,
      value: DatabaseService().employees,
      child: cards,
    );
  }
}
