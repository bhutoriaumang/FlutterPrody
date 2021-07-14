import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prody/models/project.dart';

class DataBaseServiceProject {
  final CollectionReference _projects =
      FirebaseFirestore.instance.collection("Projects");

  Future updateProjectData(String title, String details, List deadlines,
      List employees, String leader) async {
    return await _projects.doc(title).set({
      "title": title,
      "details": details,
      "deadlines": deadlines,
      "employees": employees,
      "webTeam": employees,
      "leader": leader,
    });
  }

  Project _projectDataFromSnapshot(DocumentSnapshot snapshot) {
    return Project(
        title: snapshot.get("title"),
        details: snapshot.get("details"),
        deadlines: snapshot.get("deadlines"),
        designTeam: snapshot.get("employees"),
        webTeam: snapshot.get("webTeam"),
        leader: snapshot.get("leader"));
  }

  Stream<Project> projectData(String uid) {
    return _projects
        .doc(uid)
        .snapshots()
        .map((snapshot) => _projectDataFromSnapshot(snapshot));
  }

  Future<List<Project>> userProjects(String uid) async {
    List<Project> projects = [];
    await _projects
        .where("employees", arrayContains: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        projects.add(Project(
            title: doc["title"],
            details: doc["details"],
            deadlines: doc["deadlines"],
            designTeam: doc["employees"],
            webTeam: doc["webTeam"],
            leader: doc["leader"]));
      });
    });
    return projects;
  }
}
