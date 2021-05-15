import 'package:flutter/material.dart';
import 'package:prody/services/database.dart';
import 'package:prody/shared/constants.dart';

class EmployeeDetail extends StatelessWidget {
  final String uid, designation;

  EmployeeDetail({@required this.uid, @required this.designation});

  @override
  Widget build(BuildContext context) {
    DatabaseService _database = DatabaseService(uid: uid);

    return FutureBuilder(
      future: _database.employee().then((employee) => employee),
      builder: (context, snapshot) {
        if(snapshot != null)
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: tertiaryColor,
            elevation: 10,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          color: primaryColor,
                          size: MediaQuery.of(context).size.width * 0.3,
                        ),
                        radius: MediaQuery.of(context).size.width * 0.15,
                        backgroundColor: tertiaryColor,
                      ),
                      Text( designation,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02),
                        child: Row(
                            children: [
                              Icon(
                                Icons.person_add_alt_1_outlined,
                                color: primaryColor,
                              ),
                              Container(
                                child: Text( snapshot.data.name,
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: primaryColor,
                            ),
                            Text(
                              snapshot.data.phn,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: primaryColor,
                            ),
                            Container(
                              child: Text(
                                snapshot.data.email,
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.025,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                          children: [
                            Icon(
                              Icons.alternate_email,
                              color: primaryColor,
                            ),
                            Container(
                              child: Text(
                                snapshot.data.linkedIn,
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.03,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        else
          return Container();
      },
    );
  }
}
