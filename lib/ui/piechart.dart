import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PieChart3 extends StatelessWidget {
  final double completed;
  final Color primarycolor = Color.fromRGBO(5, 68, 94, 1);
  final Color secondarycolor = Color.fromRGBO(24, 154, 180, 1);
  final Color tertiarycolor = Color.fromRGBO(212, 241, 244, 1);

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
        radius: 100.0,
        lineWidth: 12.0,
        animation: true,
        percent: completed,
        center: new Text(
          (completed * 100).toStringAsPrecision(4) + "%",
          style: new TextStyle(
              fontWeight: FontWeight.bold, color: primarycolor, fontSize: 14.0),
        ),
        footer: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            "Completion",
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: primarycolor,
                fontSize: 14.0),
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
  final Color primarycolor = Color.fromRGBO(5, 68, 94, 1);
  final Color secondarycolor = Color.fromRGBO(24, 154, 180, 1);
  final Color tertiarycolor = Color.fromRGBO(212, 241, 244, 1);

  PieChart2({this.completed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
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
                color: primarycolor,
                fontSize: 14.0),
          ),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: primarycolor.withOpacity(0.75),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
