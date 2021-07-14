import 'package:flutter/material.dart';
import 'package:prody/ui/cards/employees.dart';
import 'package:provider/provider.dart';

import '../../models/CurrentUser.dart';

class EmployeesList extends StatefulWidget {
  @override
  _EmployeesListState createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  @override
  Widget build(BuildContext context) {
    final employee = Provider.of<Employee>(context);
    var employees = Provider.of<List<Employee>>(context) ?? [];
    List employeesid = [], unselected = [], selected = [];
    for (int i = 0; i < employees.length; i++) {
      employeesid.add(employees[i].uid);
      unselected.add(employees[i].uid);
    }
    return EmployeesProjectList(
      members: employeesid,
      selected: selected,
      unselected: unselected,
    );
  }
}
