import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_indicator/loading_indicator.dart';

class DailyReportwidget extends StatefulWidget {
  String? username;
  String? techname;
  DailyReportwidget({this.username, this.techname});

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
        height: s.height * 0.7,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: s.height * 0.02,),
              Row(
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
                  const SizedBox(width: 10,),
                  Text(
                    "${widget.techname}",
                    style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 17,
                        fontWeight: FontWeight.w700,),
                  ),
                  SizedBox(width: s.height * 0.02,),
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
                                snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                                  Map a =
                                      document.data() as Map<String, dynamic>;
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

                                initState() {
                                  setState(() {
                                    a = assigned.length;
                                    p = pendingpgms.length;
                                    pro = processingpgm.length;
                                    c = completedpgm.length;
                                  });
                                }

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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2,
                                                      horizontal: 10),
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
                                                    fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 15),
                                              )),
                                            )
                                          : Row(
                                            children: [
                                              Container(
                                            padding: const EdgeInsets
                                                    .symmetric(
                                                vertical: 1,
                                                horizontal: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10),
                                                color: const Color(
                                                    0XFF72b01d)),
                                            child: const Center(
                                                child: Text(
                                              "Active",
                                              style: TextStyle(
                                                  fontFamily:
                                                      "Montserrat",
                                                  color: white,
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.w600),
                                              textAlign: TextAlign.center,
                                            )),
                                          ),
                                              const SizedBox(width: 10,),
                                              Container(
                                                decoration:
                                                    const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      Color(0xFFffd500),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets
                                                          .all(10.0),
                                                  child: Text(
                                                    "${assigned.length}",
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight
                                                                .bold,
                                                        color: white),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                decoration:
                                                    const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      Color(0XFF70e000),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets
                                                          .all(10.0),
                                                  child: Text(
                                                    "${completedpgm.length}",
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight
                                                                .bold,
                                                        color: white),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                decoration:
                                                    const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      Color(0xFFd62839),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets
                                                          .all(10.0),
                                                  child: Text(
                                                    "${pendingpgms.length}",
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight
                                                                .bold,
                                                        color: white),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                decoration:
                                                    const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      Color(0xFF1e96fc),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets
                                                          .all(10.0),
                                                  child: Text(
                                                    "${processingpgm.length}",
                                                    style:
                                                        const TextStyle(
                                                      fontFamily:
                                                          "Montserrat",
                                                      fontWeight:
                                                          FontWeight.bold,
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
            ],
          ),
        ));
  }
}