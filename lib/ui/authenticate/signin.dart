import 'package:flutter/material.dart';
import 'package:prody/services/auth.dart';
import 'package:prody/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView, Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

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
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  decoration: textInputDecoration.copyWith(hintText: 'Email')),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.length < 6
                    ? 'Enter a password with at least 6 characters'
                    : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
              ),
              SizedBox(height: 20.0),
              MaterialButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.signIn(email, password);
                    if (result == null)
                      setState(() => error = "Please enter a valid email");
                  }
                },
                color: primarycolor,
                child: Text(
                  "Sign In",
                  style: TextStyle(color: tertiarycolor),
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New User?"),
                  MaterialButton(
                    onPressed: () => widget.toggleView(),
                    child: Text(
                      "Register",
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
