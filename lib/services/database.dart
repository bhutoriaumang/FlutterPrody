import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:prody/models/CurrentUser.dart';

class DatabaseService {
  final String uid;

  DatabaseService({@required this.uid});

  final CollectionReference _employees =
      FirebaseFirestore.instance.collection("Employees");

  Future updateEmployeeData(
      String name, String phn, String email, String linkedIn) async {
    print("$name, $phn, $email, $linkedIn");
    return await _employees.doc(uid).set({
      "uid": uid,
      "name": name,
      "phn": phn,
      "email": email,
      "linkedIn": linkedIn,
    });
  }

  Employee _employeeDataFromSnapshot(DocumentSnapshot snapshot) {
    return Employee(
      uid: uid,
      name: snapshot.get("name"),
      phn: snapshot.get("phn"),
      email: snapshot.get("email"),
      linkedIn: snapshot.get("linkedIn"),
    );
  }

  Stream<Employee> get employeeData {
    return _employees
        .doc(uid)
        .snapshots()
        .map((snapshot) => _employeeDataFromSnapshot(snapshot));
  }
}
