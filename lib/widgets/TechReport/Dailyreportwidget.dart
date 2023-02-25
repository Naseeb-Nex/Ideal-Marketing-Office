import 'package:flutter/material.dart';
import 'dart:math';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:test2/componets/dailyassignedcard.dart';
import 'package:test2/componets/dailycompletedcard.dart';
import 'package:test2/componets/dailypendingcard.dart';
import 'package:test2/componets/dailyprocessingcard.dart';
import 'package:test2/componets/vreportoverviewcard.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_indicator/loading_indicator.dart';

// ignore: must_be_immutable
class DailyReportwidget extends StatefulWidget {
  String? username;
  String? techname;
  DailyReportwidget({Key? key, this.username, this.techname}) : super(key: key);

  @override
  State<DailyReportwidget> createState() => _DailyReportwidgetState();
}

class _DailyReportwidgetState extends State<DailyReportwidget> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  // data
  int a = 0;
  int p = 0;
  int c = 0;
  int pro = 0;

  // ignore: non_constant_identifier_names
  bool is_sub = true;

  // Daily activity filter
  // ignore: non_constant_identifier_names
  String daily_activity_filter = "all";

// Images
  var random = Random();
  List<String> techimg = [
    "assets/icons/tech_avatar1.png",
    "assets/icons/tech_avatar2.png",
    "assets/icons/tech_avatar3.png",
  ];
  
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    // Date
    DateTime now = DateTime.now();

    // Report
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);

    // Image selection task
    int num = random.nextInt(100);
    int loc = num % 3;

    return SizedBox(
        height: s.height * 0.8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: s.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: s.height * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: s.height * 0.08,
                      height: s.height * 0.08,
                      child: Image.asset(
                        techimg[loc],
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${widget.techname}",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: s.height * 0.02,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: fb
                            .collection("Reports")
                            .doc(year)
                            .collection("Month")
                            .doc(month)
                            .collection(day)
                            .doc("Tech")
                            .collection("Reports")
                            .doc("${widget.username}")
                            .collection("Activity")
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {}
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: LoadingIndicator(
                                  indicatorType:
                                      Indicator.ballClipRotateMultiple,
                                  colors: [bluebg],
                                ),
                              ),
                            );
                          }

                          // fetched data assigning phase
                          final List rpactivity = [];
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map a = document.data() as Map<String, dynamic>;
                            rpactivity.add(a);
                          }).toList();

                          List pendingpgms = rpactivity
                              .where((i) => i['status'] == 'pending')
                              .toList();

                          List completedpgm = rpactivity
                              .where((i) => i['status'] == 'completed')
                              .toList();

                          List processingpgm = rpactivity
                              .where((i) => i['status'] == 'processing')
                              .toList();

                          List assigned = rpactivity
                              .where((i) => i['status'] == 'assigned')
                              .toList();

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: pendingpgms.isEmpty &&
                                        processingpgm.isEmpty &&
                                        assigned.isEmpty &&
                                        completedpgm.isEmpty
                                    ? Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0XFFf25c54),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          "No work",
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        )),
                                      )
                                    : Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 1, horizontal: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color(0XFF72b01d)),
                                            child: const Center(
                                                child: Text(
                                              "Active",
                                              style: TextStyle(
                                                  fontFamily: "Montserrat",
                                                  color: white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.center,
                                            )),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFffd500),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                "${assigned.length}",
                                                style: const TextStyle(
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.bold,
                                                    color: white),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0XFF70e000),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                "${completedpgm.length}",
                                                style: const TextStyle(
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.bold,
                                                    color: white),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFd62839),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                "${pendingpgms.length}",
                                                style: const TextStyle(
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.bold,
                                                    color: white),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFF1e96fc),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                "${processingpgm.length}",
                                                style: const TextStyle(
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.bold,
                                                  color: white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ],
                          );
                        })
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Report
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: s.height * 0.02, horizontal: s.height * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Todays's Recap",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: bluebg),
                    ),
                    SizedBox(
                      height: s.height * 0.015,
                    ),
                    const Divider(
                      height: 3,
                      thickness: 3,
                      color: bluebg,
                    ),
                  ],
                ),
              ),

              // report Submission status
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: s.height * 0.03,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: s.height * 0.03, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 4,
                          color: black.withOpacity(.1),
                          offset: const Offset(0, 2),
                        ),
                      ]),
                  child: Column(children: [
                    Row(
                      children:  const [
                        Text(
                          "Summary Report",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: bluebg,
                          ),
                        ),
                      ],
                    ),
                     const Divider(),
                     const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder<DocumentSnapshot>(
                      future: fb
                          .collection("Reports")
                          .doc(year)
                          .collection("Month")
                          .doc(month)
                          .collection(day)
                          .doc("Tech")
                          .collection("Reports")
                          .doc(widget.username)
                          .get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return  const Text("Something went wrong");
                        }

                        if (snapshot.hasData && !snapshot.data!.exists) {
                          return SizedBox(
                            width: double.infinity,
                            height: s.height * 0.27,
                            child: Image.asset(
                              "assets/icons/notsub.jpg",
                              fit: BoxFit.contain,
                            ),
                          );
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: s.height * 0.02, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                        color: black.withOpacity(.08),
                                        offset: const Offset(0, 2),
                                      ),
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          "assets/icons/scooter.png",
                                          width: s.height * 0.08,
                                          height: s.height * 0.08,
                                        ),
                                         const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "Vehicle Details",
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 19,
                                          ),
                                        ),
                                      ],
                                    ),
                                     const SizedBox(height: 5),
                                    StreamBuilder<QuerySnapshot>(
                                        stream: fb
                                            .collection("Reports")
                                            .doc(year)
                                            .collection("Month")
                                            .doc(month)
                                            .collection(day)
                                            .doc("Tech")
                                            .collection("Reports")
                                            .doc("${widget.username}")
                                            .collection("vehicle")
                                            .snapshots(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<QuerySnapshot>
                                                snapshot) {
                                          if (snapshot.hasError) {}
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Center(
                                              child: SizedBox(
                                                width: s.height * 0.08,
                                                height: s.height * 0.08,
                                                child: const LoadingIndicator(
                                                  indicatorType: Indicator
                                                      .ballClipRotateMultiple,
                                                  colors: [bluebg],
                                                ),
                                              ),
                                            );
                                          }

                                          final List vehicle = [];
                                          snapshot.data!.docs
                                              .map((DocumentSnapshot document) {
                                            Map a = document.data()
                                                as Map<String, dynamic>;
                                            vehicle.add(a);
                                            // a['uid'] = document.id;
                                          }).toList();
                                          return Column(
                                            children: [
                                              Container(
                                                  child: vehicle.isEmpty
                                                      ? Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      s.height *
                                                                          0.01),
                                                          child: Column(
                                                            children: [
                                                              Image.asset(
                                                                "assets/icons/warning.png",
                                                                height:
                                                                    s.height *
                                                                        0.12,
                                                              ),
                                                              const Text(
                                                                "No Vehicle Used !",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Montserrat",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 17,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : null),
                                              for (var i = 0;
                                                  i < vehicle.length;
                                                  i++) ...[
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 5.0),
                                                  child: Vreportoverviewcard(
                                                    name: vehicle[i]['name'],
                                                    vdocname: vehicle[i]
                                                        ['vdocname'],
                                                    docname: vehicle[i]
                                                        ['docname'],
                                                    username: vehicle[i]
                                                        ['username'],
                                                    update: vehicle[i]
                                                        ['upDate'],
                                                    start: vehicle[i]['start'],
                                                    end: vehicle[i]['end'],
                                                    desc: vehicle[i]['desc'],
                                                    uptime: vehicle[i]
                                                        ['upTime'],
                                                  ),
                                                )
                                              ]
                                            ],
                                          );
                                        }),
                                  ],
                                ),
                              ),
                             const   SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: s.height * 0.02,
                                    vertical: s.height * 0.02),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        color: black.withOpacity(.1),
                                        offset: const  Offset(1, 2),
                                      ),
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          "assets/icons/expenses.png",
                                          width: s.height * 0.08,
                                          height: s.height * 0.08,
                                        ),
                                         const SizedBox(
                                          width: 10,
                                        ),
                                        const  Text(
                                          "Expense Details",
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                     const Divider(),
                                    const  SizedBox(height: 5),
                                    FutureBuilder<DocumentSnapshot>(
                                      future: fb
                                          .collection("Reports")
                                          .doc(year)
                                          .collection("Month")
                                          .doc(month)
                                          .collection(day)
                                          .doc("Tech")
                                          .collection("Reports")
                                          .doc("${widget.username}")
                                          .get(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<DocumentSnapshot>
                                              snapshot) {
                                        if (snapshot.hasError) {
                                          return  const Text("Something went wrong");
                                        }

                                        if (snapshot.hasData &&
                                            !snapshot.data!.exists) {
                                          return  const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 40),
                                            child: Text(
                                              "No data Found!",
                                              style: TextStyle(
                                                  fontFamily: "Montserrat",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          );
                                        }

                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          Map<String, dynamic> data =
                                              snapshot.data!.data()
                                                  as Map<String, dynamic>;

                                          return Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "${data['expense']}",
                                                      style: const  TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          );
                                        }

                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: white,
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(0, 10),
                                                blurRadius: 20,
                                                color:
                                                    secondbg.withOpacity(0.23),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: s.height * 0.1),
                                            child: Center(
                                              child: SizedBox(
                                                width: s.height * 0.15,
                                                height: s.height * 0.15,
                                                child:  const LoadingIndicator(
                                                  indicatorType: Indicator
                                                      .ballClipRotateMultiple,
                                                  colors:  [black],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 10),
                                blurRadius: 20,
                                color: secondbg.withOpacity(0.23),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: s.width * 0.1),
                            child: Center(
                              child: SizedBox(
                                width: s.height * 0.08,
                                height: s.height * 0.08,
                                child: const LoadingIndicator(
                                  indicatorType:
                                      Indicator.ballClipRotateMultiple,
                                  colors: [bluebg],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ]),
                ),
              ),
              const  SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    s.height * 0.03, 0, s.height * 0.03, s.height * 0.02),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: s.height * 0.025, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 4,
                        color: black.withOpacity(.1),
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  const [
                          Text(
                            "Daily Activity",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: bluebg,
                            ),
                          ),
                        ],
                      ),
                      const  Divider(),
                      const  SizedBox(
                        height: 8,
                      ),
                      // Daily Activity
                      StreamBuilder<QuerySnapshot>(
                        stream: fb
                            .collection("Reports")
                            .doc(year)
                            .collection("Month")
                            .doc(month)
                            .collection(day)
                            .doc("Tech")
                            .collection("Reports")
                            .doc("${widget.username}")
                            .collection("Activity")
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Column(
                              children: [
                                Image.asset(
                                  "assets/icons/noprograms.jpg",
                                  width: double.infinity,
                                  height: s.height * 0.3,
                                  fit: BoxFit.contain,
                                ),
                                const Text(
                                  "No Programs Found !",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            );
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: s.height * 0.03),
                                child: SizedBox(
                                  width: s.height * 0.25,
                                  height: s.height * 0.25,
                                  child:  const LoadingIndicator(
                                    indicatorType:
                                        Indicator.ballClipRotateMultiple,
                                    colors:  [bluebg],
                                  ),
                                ),
                              ),
                            );
                          }

                          final List activityrp = [];
                          List filteredActivity = [];
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map a = document.data() as Map<String, dynamic>;
                            activityrp.add(a);
                          }).toList();

                          if (daily_activity_filter == "all") {
                            filteredActivity = activityrp;
                          } else {
                            filteredActivity = activityrp
                                .where(
                                    (i) => i['status'] == daily_activity_filter)
                                .toList();
                          }

                          return Column(
                            children: [
                              Container(
                                child: activityrp.isEmpty
                                    ? Column(
                                        children: [
                                          Image.asset(
                                            "assets/icons/noprograms.jpg",
                                            width: double.infinity,
                                            height: s.height * 0.3,
                                            fit: BoxFit.contain,
                                          ),
                                          const Text(
                                            "No Programs Found !",
                                            style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          )
                                        ],
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap: () => setState(() {
                                                    daily_activity_filter =
                                                        "all";
                                                  }),
                                                  child: Container(
                                                    width: s.height * 0.15,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical:
                                                          s.height * 0.015,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            daily_activity_filter ==
                                                                    "all"
                                                                ? bluebg
                                                                : nonactivebg),
                                                    child: Center(
                                                      child: Text(
                                                        "All",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: daily_activity_filter ==
                                                                    "all"
                                                                ? white
                                                                : nonactivetxt),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: s.height * 0.03),
                                                InkWell(
                                                  onTap: () => setState(() {
                                                    daily_activity_filter =
                                                        "assigned";
                                                  }),
                                                  child: Container(
                                                    width: s.height * 0.2,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical:
                                                          s.height * 0.015,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            daily_activity_filter ==
                                                                    "assigned"
                                                                ? bluebg
                                                                : nonactivebg),
                                                    child: Center(
                                                      child: Text(
                                                        "Assigned",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: daily_activity_filter ==
                                                                    "assigned"
                                                                ? white
                                                                : nonactivetxt),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: s.height * 0.03),
                                                InkWell(
                                                  onTap: () => setState(() {
                                                    daily_activity_filter =
                                                        "pending";
                                                  }),
                                                  child: Container(
                                                    width: s.height * 0.2,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical:
                                                          s.height * 0.015,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            daily_activity_filter ==
                                                                    "pending"
                                                                ? bluebg
                                                                : nonactivebg),
                                                    child: Center(
                                                      child: Text(
                                                        "Pending",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: daily_activity_filter ==
                                                                    "pending"
                                                                ? white
                                                                : nonactivetxt),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: s.height * 0.03),
                                                InkWell(
                                                  onTap: () => setState(() {
                                                    daily_activity_filter =
                                                        "completed";
                                                  }),
                                                  child: Container(
                                                    width: s.height * 0.2,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical:
                                                          s.height * 0.015,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            daily_activity_filter ==
                                                                    "completed"
                                                                ? bluebg
                                                                : nonactivebg),
                                                    child: Center(
                                                      child: Text(
                                                        "Completed",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: daily_activity_filter ==
                                                                    "completed"
                                                                ? white
                                                                : nonactivetxt),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: s.height * 0.03),
                                                InkWell(
                                                  onTap: () => setState(() {
                                                    daily_activity_filter =
                                                        "processing";
                                                  }),
                                                  child: Container(
                                                    width: s.height * 0.2,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical:
                                                          s.height * 0.015,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            daily_activity_filter ==
                                                                    "processing"
                                                                ? bluebg
                                                                : nonactivebg),
                                                    child: Center(
                                                      child: Text(
                                                        "Processing",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: daily_activity_filter ==
                                                                    "processing"
                                                                ? white
                                                                : nonactivetxt),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                           const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                              ),
                              Container(
                                child: activityrp.isEmpty
                                    ? null
                                    : Container(
                                        child: filteredActivity.isEmpty
                                            ? Padding(
                                                padding: EdgeInsets.only(
                                                    top: s.height * 0.1),
                                                child: SizedBox(
                                                    height: s.height * 0.4,
                                                    width: s.height * 0.4,
                                                    child: Image.asset(
                                                        "assets/icons/no_result.png")),
                                              )
                                            : null),
                              ),
                              for (var i = 0;
                                  i < filteredActivity.length;
                                  i++) ...[
                                Activitywrapper(
                                  name: filteredActivity[i]['name'],
                                  address: filteredActivity[i]['address'],
                                  loc: filteredActivity[i]['loc'],
                                  phn: filteredActivity[i]['phn'],
                                  pgm: filteredActivity[i]['pgm'],
                                  chrg: filteredActivity[i]['chrg'],
                                  type: filteredActivity[i]['type'],
                                  upDate: filteredActivity[i]['upDate'],
                                  upTime: filteredActivity[i]['upTime'],
                                  docname: filteredActivity[i]['docname'],
                                  status: filteredActivity[i]['status'],
                                  username: filteredActivity[i]['username'],
                                  techname: filteredActivity[i]['techname'],
                                  assignedtime: filteredActivity[i]
                                      ['assignedtime'],
                                  assigneddate: filteredActivity[i]
                                      ['assigneddate'],
                                  priority: filteredActivity[i]['priority'],
                                  camount: filteredActivity[i]['camount'],
                                  remarks: filteredActivity[i]['remarks'],
                                  cdate: filteredActivity[i]['cdate'],
                                  ctime: filteredActivity[i]['ctime'],
                                  ccollname: filteredActivity[i]['ccollname'],
                                  cdocname: filteredActivity[i]['cdocname'],
                                  custdocname: filteredActivity[i]
                                      ['custdocname'],
                                  rpdocname: filteredActivity[i]['rpdocname'],
                                ),
                                 const SizedBox(
                                  height: 10,
                                ),
                              ],
                              Container(
                                  child: activityrp.isEmpty
                                      ? null
                                      : Container(
                                          child: filteredActivity.isEmpty
                                              ? SizedBox(
                                                  height: s.height * 0.12)
                                              : SizedBox(
                                                  height: s.height * 0.05),
                                        ))
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class Activitywrapper extends StatelessWidget {
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? pgm;
  String? chrg;
  String? type;
  String? upDate;
  String? upTime;
  String? docname;
  String? status;
  String? username;
  String? techname;
  String? assignedtime;
  String? assigneddate;
  String? priority;
  String? camount;
  String? remarks;
  String? ctime;
  String? cdate;
  String? ccollname;
  String? cdocname;
  String? custdocname;
  String? rpdocname;

  Activitywrapper({
    Key? key,
    this.name,
    this.address,
    this.loc,
    this.phn,
    this.pgm,
    this.chrg,
    this.type,
    this.upDate,
    this.upTime,
    this.docname,
    this.status,
    this.username,
    this.techname,
    this.assignedtime,
    this.assigneddate,
    this.priority,
    this.camount,
    this.remarks,
    this.cdate,
    this.ctime,
    this.ccollname,
    this.cdocname,
    this.custdocname,
    this.rpdocname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == "completed") {
      return Dailycompltedcard(
        name: name,
        address: address,
        loc: loc,
        phn: phn,
        pgm: pgm,
        chrg: chrg,
        type: type,
        upDate: upDate,
        upTime: upTime,
        docname: docname,
        status: status,
        username: username,
        techname: techname,
        assignedtime: assignedtime,
        assigneddate: assigneddate,
        priority: priority,
        camount: camount,
        ctime: ctime,
        remarks: remarks,
      );
    } else if (status == "pending") {
      return Dailypendingcard(
        name: name,
        address: address,
        loc: loc,
        phn: phn,
        pgm: pgm,
        chrg: chrg,
        type: type,
        upDate: upDate,
        upTime: upTime,
        docname: docname,
        status: status,
        username: username,
        techname: techname,
        assignedtime: assignedtime,
        assigneddate: assigneddate,
        priority: priority,
        remarks: remarks,
        pdate: cdate,
        ptime: ctime,
      );
    } else if (status == "processing") {
      return Dailyprocessingcard(
        name: name,
        address: address,
        loc: loc,
        phn: phn,
        pgm: pgm,
        chrg: chrg,
        type: type,
        upDate: upDate,
        upTime: upTime,
        docname: docname,
        status: status,
        username: username,
        techname: techname,
        assignedtime: assignedtime,
        assigneddate: assigneddate,
        priority: priority,
        ptime: ctime,
        pdate: cdate,
        remarks: remarks,
      );
    }
    return Dailyassignedcard(
      name: name,
      address: address,
      loc: loc,
      phn: phn,
      pgm: pgm,
      chrg: chrg,
      type: type,
      upDate: upDate,
      upTime: upTime,
      docname: docname,
      status: status,
      username: username,
      techname: techname,
      assignedtime: assignedtime,
      assigneddate: assigneddate,
      priority: priority,
      custdocname: custdocname,
    );
  }
}
