import 'package:flutter/material.dart';
import 'package:prody/ui/cards/employees.dart';
import 'package:prody/ui/screens/teamMembersInfo.dart';
import 'package:provider/provider.dart';

import '../../models/CurrentUser.dart';

class EmployeesList extends StatefulWidget {
  @override
  _EmployeesListState createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  @override
  Widget build(BuildContext context) {
    var employees = Provider.of<List<Employee>>(context) ?? [];
    List employeesid = [];
    for (int i = 0; i < employees.length; i++) {
      employeesid.add(employees[i].uid);
    }
    return EmployeesProjectList(
      members: employeesid,
    );
  }
}
