import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:prody/shared/constants.dart';

class PieChart3 extends StatelessWidget {
  final double completed;

  PieChart3({this.completed});

  @override
  Widget build(BuildContext context) {
    MaterialAccentColor color;
    if (completed < 0.5)
      color = Colors.redAccent;
    else if (completed < 0.75)
      color = Colors.yellowAccent;
    else
      color = Colors.greenAccent;

    return Container(
      child: new CircularPercentIndicator(
        radius: MediaQuery.of(context).size.width * 0.27,
        lineWidth: 12.0,
        animation: true,
        percent: completed,
        center: new Text(
          (completed * 100).toStringAsPrecision(4) + "%",
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.04),
        ),
        footer: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
          child: new Text(
            "Completion",
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor,
                fontSize: MediaQuery.of(context).size.width * 0.04),
          ),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: color,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class PieChart2 extends StatelessWidget {
  final double completed;

  PieChart2({this.completed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
      width: MediaQuery.of(context).size.width * 0.1,
      child: new CircularPercentIndicator(
        radius: 80.0,
        lineWidth: 8.0,
        animation: true,
        percent: completed,
        center: Padding(
          padding: const EdgeInsets.all(2.0),
          child: new Text(
            (completed * 100).toStringAsPrecision(2) + "%",
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor,
                fontSize: MediaQuery.of(context).size.width * 0.04),
          ),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: primaryColor.withOpacity(0.75),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
