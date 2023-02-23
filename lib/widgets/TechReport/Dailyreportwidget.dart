import 'package:flutter/material.dart';

class DailyReportwidget extends StatefulWidget {
  String? username;
  String? techname;
   DailyReportwidget({this.username, this.techname});

  @override
  State<DailyReportwidget> createState() => _DailyReportwidgetState();
}

class _DailyReportwidgetState extends State<DailyReportwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Daily"),);
  }
}