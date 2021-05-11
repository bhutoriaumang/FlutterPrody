import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  final Color primarycolor = Color.fromRGBO(5, 68, 94, 1);
  final Color secondarycolor = Color.fromRGBO(24, 154, 180, 1);
  final Color tertiarycolor = Color.fromRGBO(212, 241, 244, 1);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.18,
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
          padding: const EdgeInsets.only(top: 20.0, left: 20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                color: tertiarycolor, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 00.0),
                    child: Row(
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
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: Row(
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
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: Row(
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
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 00.0),
                    child: Row(
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
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
