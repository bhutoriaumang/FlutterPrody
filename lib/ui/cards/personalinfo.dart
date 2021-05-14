import 'package:flutter/material.dart';
import 'package:prody/shared/constants.dart';

class PersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
              left: MediaQuery.of(context).size.width * 0.05),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
                color: tertiaryColor, borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: CircleAvatar(
              child: Icon(
                Icons.person,
                color: primaryColor,
                size: MediaQuery.of(context).size.height * 0.16,
              ),
              radius: MediaQuery.of(context).size.width * 0.35,
              backgroundColor: tertiaryColor,
            )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
              left: MediaQuery.of(context).size.width * 0.05),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                color: tertiaryColor, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.person_add_alt_1_outlined,
                          color: primaryColor,
                        ),
                        Container(
                          child: Text(
                            "Umang Bhutoria",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
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
                          color: primaryColor,
                        ),
                        Text(
                          "6290340456",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.email,
                          color: primaryColor,
                        ),
                        Container(
                          child: Text(
                            "bhutoriaumang@gmail.com",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.022,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.alternate_email,
                          color: primaryColor,
                        ),
                        Container(
                          child: Text(
                            "Umang@linkedIn.com",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.025,
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
