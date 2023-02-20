import 'package:loading_indicator/loading_indicator.dart';
import 'package:test2/componets/techreportcard.dart';
import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';

// ignore: must_be_immutable
class Reportsrcwidget extends StatefulWidget {
  String? uid;
  String? username;
  String? techname;
  Reportsrcwidget({Key? key, this.uid, this.username, this.techname})
      : super(key: key);

  @override
  ReportsrcwidgetState createState() => ReportsrcwidgetState();
}

class ReportsrcwidgetState extends State<Reportsrcwidget> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  int p = 0, c = 0;
  int touchedIndex = 0;
  bool rpstatus = false;

  @override
  Widget build(BuildContext context) {
    // adaptive size
    Size s = MediaQuery.of(context).size;
    // Date
    DateTime now = DateTime.now();

    // Report
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: s.width * 0.03),
                child: const Text(
                  "Report",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: bluebg,
                  ),
                ),
              ),
            ],
          ),
          // Container(
          //   height: 3,
          //   width: 36,
          //   decoration: BoxDecoration(
          //       color: Colors.blueAccent,
          //       borderRadius: BorderRadius.circular(10)),
          // ),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: s.width * 0.03),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: s.width * 0.02,
                              vertical: s.height * 0.03),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    color: black.withOpacity(0.1))
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "OVERVIEW",
                                style: TextStyle(
                                    color: bluebg,
                                    fontFamily: "Montserrat",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Divider(
                                endIndent: 10,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AspectRatio(
                                aspectRatio: 1.3,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: rpstatus
                                      ? StreamBuilder<
                                          DocumentSnapshot<
                                              Map<String, dynamic>>>(
                                          stream: fb
                                              .collection("Reports")
                                              .doc(year)
                                              .collection("Month")
                                              .doc(month)
                                              .collection(day)
                                              .doc("Counter")
                                              .snapshots(),
                                          builder: (_, snapshot) {
                                            if (snapshot.hasError) {
                                              return Text(
                                                  'Error = ${snapshot.error}');
                                            }

                                            if (snapshot.hasData) {
                                              var output =
                                                  snapshot.data!.data();
                                              double a = 0,
                                                  c = 0,
                                                  pro = 0,
                                                  p = 0;

                                              if (output != null) {
                                                var assigned =
                                                    output['assigned'];
                                                var competed =
                                                    output['completed'];
                                                var pending = output['pending'];
                                                var processing =
                                                    output['processing'];

                                                if (assigned != null) {
                                                  a = assigned.toDouble();
                                                } else {
                                                  a = 0;
                                                }

                                                if (pending != null) {
                                                  p = pending.toDouble();
                                                } else {
                                                  p = 0;
                                                }

                                                if (processing != null) {
                                                  pro = processing.toDouble();
                                                } else {
                                                  pro = 0;
                                                }

                                                if (competed != null) {
                                                  c = competed.toDouble();
                                                } else {
                                                  c = 0;
                                                }
                                              }
                                              return PieChart(
                                                PieChartData(
                                                    borderData: FlBorderData(
                                                      show: false,
                                                    ),
                                                    sectionsSpace: 0,
                                                    centerSpaceRadius: 0,
                                                    sections: showingSections(
                                                        a, p, c, pro)),
                                              );
                                            }

                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          },
                                        )
                                      : Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Image.asset(
                                            'assets/images/emptyreport.gif',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 10,
                                              color: const Color(0xFF70e000),
                                            ),
                                            SizedBox(
                                              width: s.width * 0.02,
                                            ),
                                            const Text(
                                              "Completed",
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 13,
                                                // color: Color(0xff70e000),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 10,
                                              color: const Color(0xFFd62839),
                                            ),
                                            SizedBox(
                                              width: s.width * 0.02,
                                            ),
                                            const Text(
                                              "Pending",
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 13,
                                                // color: Color(0xffd62839),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 10,
                                              color: const Color(0xFF1e96fc),
                                            ),
                                            SizedBox(
                                              width: s.width * 0.02,
                                            ),
                                            const Text(
                                              "Processing",
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 13,
                                                // color: Color(0xffd62839),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 10,
                                              color: const Color(0xFFffd500),
                                            ),
                                            SizedBox(
                                              width: s.width * 0.02,
                                            ),
                                            const Text(
                                              "Assigned",
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 13,
                                                // color: Color(0xffd62839),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "*Today's Summary",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 10,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: s.height * 0.03),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: s.height * 0.03, vertical: s.height * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 5,
                              color: black.withOpacity(0.1))
                        ]),
                    child: Column(
                      children: [
                        const Text(
                          "REPORT",
                          style: TextStyle(
                              color: bluebg,
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const Divider(
                          endIndent: 10,
                        ),
                        StreamBuilder<QuerySnapshot>(
                            stream: fb.collection("Employee").snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {}
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: SizedBox(
                                    width: s.height * 0.1,
                                    height: s.height * 0.1,
                                    child: const LoadingIndicator(
                                      indicatorType:
                                          Indicator.ballClipRotateMultiple,
                                      colors: [bluebg],
                                    ),
                                  ),
                                );
                              }

                              final List techprofile = [];
                              snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                Map a = document.data() as Map<String, dynamic>;
                                techprofile.add(a);
                                // a['uid'] = document.id;
                              }).toList();
                              return Column(
                                children: [
                                  for (var i = 0;
                                      i < techprofile.length;
                                      i++) ...[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Techreportcard(
                                        name: techprofile[i]['name'],
                                        username: techprofile[i]['username'],
                                      ),
                                    )
                                  ]
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      double a, double p, double c, double pro) {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff70e000),
            value: c == 0 ? 1 : c,
            title: '${c.toInt()}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/ophthalmology-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xff70e000),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xffffd500),
            value: a == 0 ? 1 : a,
            title: '${a.toInt()}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/librarian-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xffffd500),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xffd62839),
            value: p == 0 ? 1 : p,
            title: '${p.toInt()}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/fitness-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xffd62839),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff1e96fc),
            value: pro == 0 ? 1 : pro,
            title: '${pro.toInt()}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/worker-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xff1e96fc),
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw 'Oh no';
      }
    });
  }
}

// Badges

class _Badge extends StatelessWidget {
  final String svgAsset;
  final double size;
  final Color borderColor;

  const _Badge(
    this.svgAsset, {
    Key? key,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Icon(
          Icons.pending_actions_rounded,
          color: borderColor,
        ),
      ),
    );
  }
}
