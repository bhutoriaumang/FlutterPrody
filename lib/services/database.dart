import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prody/models/CurrentUser.dart';

class DataBaseService {
  final String uid;
  DataBaseService({this.uid});
  final CollectionReference employees =
      FirebaseFirestore.instance.collection("Employees");

  Future updataEmployeeData(
      String name, String phn, String email, String linkedIn) async {
    return await employees.doc(uid).set({
      "uid": uid,
      "name": name,
      "phn": phn,
      "email": email,
      "linkedIn": linkedIn,
    });
  }

  Employee _employeeDatafromSnapshot(DocumentSnapshot snapshot) {
    return Employee(
      uid: uid,
      name: snapshot.get("name"),
      phn: snapshot.get("phn"),
      email: snapshot.get("email"),
      linkedIn: snapshot.get("linkedIn"),
    );
  }

  Stream<Employee> get employeeData {
    return employees
        .doc(uid)
        .snapshots()
        .map((snapshot) => _employeeDatafromSnapshot(snapshot));
  }
}
