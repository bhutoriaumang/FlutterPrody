import 'package:flutter/material.dart';
import 'package:prody/services/auth.dart';
import 'package:prody/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView, Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Color primarycolor = Color.fromRGBO(5, 68, 94, 1);
  final Color secondarycolor = Color.fromRGBO(24, 154, 180, 1);
  final Color tertiarycolor = Color.fromRGBO(212, 241, 244, 1);

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String name = "";
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ProDy",
          style: TextStyle(
              color: tertiarycolor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        toolbarHeight: 80,
        backgroundColor: secondarycolor,
      ),
      backgroundColor: secondarycolor,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter a name' : null,
                  onChanged: (val) {
                    setState(() => name = val);
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Name',
                      fillColor: tertiarycolor,
                      filled: true)),
              SizedBox(height: 20.0),
              TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Email',
                      fillColor: tertiarycolor,
                      filled: true)),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.length < 6
                    ? 'Enter a password with at least 6 characters'
                    : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
                decoration: textInputDecoration.copyWith(
                    hintText: 'Password',
                    fillColor: tertiarycolor,
                    filled: true),
              ),
              SizedBox(height: 20.0),
              MaterialButton(
                onPressed: () async {
                  print("Hello");
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.register(email, password);
                    if (result == null)
                      setState(() => error = "Please enter a valid email");
                  }
                },
                color: primarycolor,
                child: Text(
                  "Register",
                  style: TextStyle(color: tertiarycolor),
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already a User?"),
                  MaterialButton(
                    onPressed: () {
                      widget.toggleView();
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text(error)
            ],
          ),
        ),
      ),
    );
  }
}
