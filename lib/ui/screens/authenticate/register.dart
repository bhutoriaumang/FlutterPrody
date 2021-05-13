import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:prody/services/auth.dart';
import 'package:prody/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView, Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String email = "";
  String password = "";
  String error = "";
  bool obscureText = true;
  Icon passwordHiddenIcon = Icon(Icons.remove_red_eye, color: secondaryColor);
  Icon passwordShownIcon =
      Icon(Icons.remove_red_eye_outlined, color: secondaryColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ProDy",
          style: TextStyle(
              color: tertiaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.08,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        backgroundColor: secondaryColor,
      ),
      backgroundColor: secondaryColor,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.055),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                    textInputAction: TextInputAction.next,
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Email',
                        fillColor: tertiaryColor,
                        filled: true)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                TextFormField(
                  validator: (val) => val.length < 6
                      ? 'Enter a password with at least 6 characters'
                      : null,
                  obscureText: obscureText,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Password',
                      fillColor: tertiaryColor,
                      filled: true,
                      suffixIcon: IconButton(
                          icon: obscureText
                              ? passwordHiddenIcon
                              : passwordShownIcon,
                          onPressed: () {
                            setState(() => obscureText = !obscureText);
                          })),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                MaterialButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      EasyLoading.show(status: "Loading...");
                      dynamic result = await _auth.register(email, password);
                      EasyLoading.dismiss();
                      if (result != null) setState(() => error = result);
                    }
                  },
                  color: primaryColor,
                  child: Text(
                    "Register",
                    style: TextStyle(color: tertiaryColor),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a User?"),
                    MaterialButton(
                      onPressed: () => widget.toggleView(),
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                Text(
                  error,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red[800]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
