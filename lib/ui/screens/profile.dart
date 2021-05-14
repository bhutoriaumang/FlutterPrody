import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:prody/models/CurrentUser.dart';
import 'package:prody/services/database.dart';
import 'package:prody/shared/constants.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  String _currentName;
  String _currentPhn;
  String _currentMail;
  String _currentLinkedIn;

  @override
  Widget build(BuildContext context) {
    final _employee = Provider.of<Employee>(context);
    DatabaseService _database = DatabaseService(uid: _employee.uid);

    return StreamBuilder(
        stream: _database.employeeData,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: secondaryColor,
              toolbarHeight: MediaQuery.of(context).size.height * 0.08,
              title: Text(
                "Profile Details",
                style: TextStyle(
                    color: tertiaryColor,
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            backgroundColor: secondaryColor,
            body: Center(
              child: SingleChildScrollView(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 10),
                          child: TextFormField(
                            style: TextStyle(color: tertiaryColor),
                            initialValue: _currentName ?? snapshot.data.name,
                            cursorColor: tertiaryColor,
                            decoration: textInputDecoration2.copyWith(
                                labelText: "Name",
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: tertiaryColor,
                                )),
                            validator: (val) =>
                                val.isEmpty ? 'Please enter a name' : null,
                            onChanged: (val) =>
                                setState(() => _currentName = val.trim()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 10),
                          child: TextFormField(
                            style: TextStyle(color: tertiaryColor),
                            initialValue: _currentPhn ?? snapshot.data.phn,
                            cursorColor: tertiaryColor,
                            decoration: textInputDecoration2.copyWith(
                                labelText: "Phone No.",
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: tertiaryColor,
                                )),
                            validator: (val) => val.isEmpty
                                ? 'Please enter a phone no.'
                                : val.length != 10
                                    ? "Enter a 10 digit phone no."
                                    : null,
                            onChanged: (val) =>
                                setState(() => _currentPhn = val.trim()),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 10),
                          child: TextFormField(
                            style: TextStyle(color: tertiaryColor),
                            initialValue: _currentMail ?? snapshot.data.email,
                            cursorColor: tertiaryColor,
                            decoration: textInputDecoration2.copyWith(
                                labelText: "Email",
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: tertiaryColor,
                                )),
                            validator: (val) =>
                                val.isEmpty ? 'Please enter an email' : null,
                            onChanged: (val) =>
                                setState(() => _currentMail = val.trim()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 10),
                          child: TextFormField(
                            style: TextStyle(color: tertiaryColor),
                            initialValue:
                                _currentLinkedIn ?? snapshot.data.linkedIn,
                            cursorColor: tertiaryColor,
                            decoration: textInputDecoration2.copyWith(
                                labelText: "LinkedIn Account",
                                prefixIcon: Icon(
                                  Icons.link,
                                  color: tertiaryColor,
                                )),
                            validator: (val) => val.isEmpty
                                ? 'Please enter a linkedIn account'
                                : null,
                            onChanged: (val) =>
                                setState(() => _currentLinkedIn = val.trim()),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.1),
                          child: MaterialButton(
                            onPressed: () async {
                              try {
                                if (_formKey.currentState.validate()) {
                                  EasyLoading.show(status: "Saving...");
                                  await _database.updateEmployeeData(
                                      _currentName ?? snapshot.data.name,
                                      _currentPhn ?? snapshot.data.phn,
                                      _currentMail ?? snapshot.data.email,
                                      _currentLinkedIn ?? snapshot.data.linkedIn);
                                  EasyLoading.dismiss();
                                  Navigator.pop(context);
                                }
                              } catch (e) {
                                EasyLoading.dismiss();
                                FirebaseException error = e;
                                EasyLoading.showToast(error.message);
                              }
                            },
                            color: primaryColor,
                            child: Text(
                              "SAVE",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
