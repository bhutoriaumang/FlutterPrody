import 'package:flutter/material.dart';
import 'package:prody/shared/constants.dart';

class PersonalInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
                color: tertiarycolor, borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: CircleAvatar(
              child: Icon(
                Icons.person,
                color: primarycolor,
                size: 100,
              ),
              radius: 50,
              backgroundColor: tertiarycolor,
            )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05, left: MediaQuery.of(context).size.width * 0.05),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                color: tertiarycolor, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.person_add_alt_1_outlined,
                          color: primarycolor,
                        ),
                        Container(
                          child: Text(
                            "Umang Bhutoria",
                            style: TextStyle(
                                color: primarycolor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.phone,
                          color: primarycolor,
                        ),
                        Text(
                          "6290340456",
                          style: TextStyle(
                              color: primarycolor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.email,
                          color: primarycolor,
                        ),
                        Container(
                          child: Text(
                            "bhutoriaumang@gmail.com",
                            style: TextStyle(
                                color: primarycolor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.alternate_email,
                          color: primarycolor,
                        ),
                        Container(
                          child: Text(
                            "Umang@linkedIn.com",
                            style: TextStyle(
                                color: primarycolor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
