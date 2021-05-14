import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prody/models/CurrentUser.dart';
import 'package:prody/ui/screens/authenticate/authenticate.dart';
import 'package:prody/ui/screens/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Employee>(context) ?? "";

    return user == null ? Authenticate() : Home();
  }
}
