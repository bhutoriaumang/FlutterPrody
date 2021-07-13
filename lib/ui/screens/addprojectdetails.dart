import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:prody/shared/constants.dart';
import 'package:prody/services/database_project.dart';

class AddProjectDetails extends StatefulWidget {
  List employees;
  AddProjectDetails({this.employees});
  @override
  _AddProjectDetailsState createState() => _AddProjectDetailsState();
}

class _AddProjectDetailsState extends State<AddProjectDetails> {
  final _formKey = GlobalKey<FormState>();
  String _currentTitle = "", _currentDesc = "";
  static List<String> deadlinesList = [null];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Project",
          style: TextStyle(
              color: tertiaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.07,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        backgroundColor: secondaryColor,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.001),
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.create_rounded,
                color: tertiaryColor,
              ),
              label: Text(
                "Create",
                style: TextStyle(color: tertiaryColor),
              ),
            ),
          )
        ],
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.07,
                          vertical: MediaQuery.of(context).size.height * 0.015),
                      child: TextFormField(
                        style: TextStyle(color: tertiaryColor),
                        initialValue: _currentTitle,
                        cursorColor: tertiaryColor,
                        decoration: textInputDecoration2.copyWith(
                            labelText: "Title",
                            prefixIcon: Icon(
                              Icons.title,
                              color: tertiaryColor,
                            )),
                        validator: (val) =>
                            val.isEmpty ? 'Please enter a title' : null,
                        onChanged: (val) =>
                            setState(() => _currentTitle = val.trim()),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.07,
                          vertical: MediaQuery.of(context).size.height * 0.015),
                      child: TextFormField(
                        maxLines: 2,
                        style: TextStyle(color: tertiaryColor),
                        initialValue: _currentDesc,
                        cursorColor: tertiaryColor,
                        decoration: textInputDecoration2.copyWith(
                            labelText: "Description",
                            prefixIcon: Icon(
                              Icons.description,
                              color: tertiaryColor,
                            )),
                        validator: (val) =>
                            val.isEmpty ? 'Please enter a description' : null,
                        onChanged: (val) =>
                            setState(() => _currentDesc = val.trim()),
                      ),
                    ),
                    ..._getFriends(),
                    Container(
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.1),
                      child: MaterialButton(
                        onPressed: () async {
                          try {
                            if (_formKey.currentState.validate()) {
                              EasyLoading.show(status: "Saving...");
                              await DataBaseServiceProject().updateProjectData(
                                  _currentTitle,
                                  _currentDesc,
                                  deadlinesList,
                                  widget.employees);
                              EasyLoading.dismiss();
                              Navigator.popUntil(
                                  context, ModalRoute.withName('/'));
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
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _getFriends() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < deadlinesList.length; i++) {
      friendsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: FriendTextFields(i)),
            SizedBox(
              width: 16,
            ),
            // we need add button at last deadlines row
            _addRemoveButton(i == deadlinesList.length - 1, i),
          ],
        ),
      ));
    }
    return friendsTextFields;
  }

  /// add / remove button
  Widget _addRemoveButton(bool add, int index) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.03,
        top: MediaQuery.of(context).size.height * 0.005,
        bottom: MediaQuery.of(context).size.height * 0.005,
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
          minWidth: MediaQuery.of(context).size.width * 0.0,
          onPressed: () {
            if (add) {
              // add new text-fields at the top of all deadlines textfields
              deadlinesList.insert(0, null);
            } else
              deadlinesList.removeAt(index);
            setState(() {});
          },
          child: Icon((add) ? Icons.add : Icons.remove)),
    );
  }
}

class FriendTextFields extends StatefulWidget {
  final int index;
  FriendTextFields(this.index);
  @override
  _FriendTextFieldsState createState() => _FriendTextFieldsState();
}

class _FriendTextFieldsState extends State<FriendTextFields> {
  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text =
          _AddProjectDetailsState.deadlinesList[widget.index] ?? '';
    });

    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.07,
      ),
      child: TextFormField(
        controller: _nameController,
        onChanged: (v) =>
            _AddProjectDetailsState.deadlinesList[widget.index] = v,
        decoration: textInputDecoration2.copyWith(
            labelText: "Deadline",
            prefixIcon: Icon(
              Icons.calendar_today,
              color: tertiaryColor,
            )),
        validator: (v) {
          if (v.trim().isEmpty) return 'Please enter something';
          return null;
        },
      ),
    );
  }
}
