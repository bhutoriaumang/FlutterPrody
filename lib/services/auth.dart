import 'package:firebase_auth/firebase_auth.dart';
import 'package:prody/models/CurrentUser.dart';
import 'package:prody/services/database.dart';
import 'package:provider/provider.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Employee _userFromFirebaseUser(User user) {
    return user != null
        ? Employee(
            uid: user.uid,
            name: "name",
            phn: "phn",
            email: "email",
            linkedIn: "linkedIn")
        : null;
  }

  Stream<Employee> get user {
    return _auth.authStateChanges().map((user) => _userFromFirebaseUser(user));
  }

  Future register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      DatabaseService(uid: result.user.uid)
          .updateEmployeeData("name", "phn", result.user.email, "linkedIn");
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      FirebaseAuthException exception = e;
      return exception.message;
    }
  }

  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      FirebaseAuthException exception = e;
      return exception.message;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
