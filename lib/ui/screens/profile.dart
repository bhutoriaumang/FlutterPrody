import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prody/shared/constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  String _currentname;
  String _currentphn;
  String _currentemail;
  String _currentlinkedIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
      ),
      backgroundColor: secondaryColor,
      body: Center(
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    "Profile Details",
                    style: TextStyle(
                        color: tertiaryColor,
                        fontSize: MediaQuery.of(context).size.height * 0.04),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10),
                  child: TextFormField(
                    style: TextStyle(color: tertiaryColor),
                    initialValue: _currentname ?? "",
                    cursorColor: tertiaryColor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: tertiaryColor,
                      ),
                      labelText: "Name",
                      labelStyle: TextStyle(color: tertiaryColor),
                      focusColor: primaryColor,
                      fillColor: tertiaryColor,
                      filled: false,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tertiaryColor)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tertiaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tertiaryColor)),
                    ),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentname = val),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10),
                  child: TextFormField(
                    style: TextStyle(color: tertiaryColor),
                    initialValue: _currentphn ?? "",
                    cursorColor: tertiaryColor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: tertiaryColor,
                      ),
                      labelText: "Phone No.",
                      labelStyle: TextStyle(color: tertiaryColor),
                      focusColor: primaryColor,
                      fillColor: tertiaryColor,
                      filled: false,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tertiaryColor)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tertiaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tertiaryColor)),
                    ),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a phone no.' : null,
                    onChanged: (val) => setState(() => _currentname = val),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10),
                  child: TextFormField(
                    style: TextStyle(color: tertiaryColor),
                    initialValue: _currentemail ?? "",
                    cursorColor: tertiaryColor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: tertiaryColor,
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(color: tertiaryColor),
                      focusColor: primaryColor,
                      fillColor: tertiaryColor,
                      filled: false,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tertiaryColor)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tertiaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tertiaryColor)),
                    ),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter an email' : null,
                    onChanged: (val) => setState(() => _currentname = val),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10),
                  child: TextFormField(
                    style: TextStyle(color: tertiaryColor),
                    initialValue: _currentlinkedIn ?? "",
                    cursorColor: tertiaryColor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: tertiaryColor,
                      ),
                      labelText: "LinkedIn Account",
                      labelStyle: TextStyle(color: tertiaryColor),
                      focusColor: primaryColor,
                      fillColor: tertiaryColor,
                      filled: false,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tertiaryColor)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tertiaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tertiaryColor)),
                    ),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a linkedIn account' : null,
                    onChanged: (val) => setState(() => _currentname = val),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
