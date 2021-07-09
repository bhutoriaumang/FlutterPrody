import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prody/models/CurrentUser.dart';

import '../models/CurrentUser.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

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

  Future<Employee> employee() async {
    return _employeeDataFromSnapshot(await _employees.doc(uid).get());
  }

  List<Employee> _employeedatafromsnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => Employee(
              name: doc.get('name') ?? '',
              email: doc.get('email') ?? '',
              phn: doc.get('phn') ?? '',
              linkedIn: doc.get('linkedIn') ?? '',
              uid: doc.get('uid') ?? '',
            ))
        .toList();
  }

  Stream<List<Employee>> get employees {
    return _employees.snapshots().map(_employeedatafromsnapshot);
  }
}
