import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';

import 'dart:math';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:test2/widgets/Reportsrcwidget.dart';

typedef void StringCallback(String val);
typedef void BoolCallback(bool active);

// ignore: must_be_immutable
class Techreportcard extends StatefulWidget {
  String? name;
  String? username;
  String? selectedUser;
  final StringCallback? callback;

  Techreportcard({Key? key, this.username, this.name, this.callback, this.selectedUser})
      : super(key: key);

  @override
  State<Techreportcard> createState() => _TechreportcardState();
}

class _TechreportcardState extends State<Techreportcard> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  // data
  int a = 0;
  int p = 0;
  int c = 0;
  int pro = 0;

  bool isSub = false;

  @override
  void initState() {
    super.initState();
    submit_validator();
  }

  var random = Random();
  List<String> techimg = [
    "assets/icons/tech_avatar1.png",
    "assets/icons/tech_avatar2.png",
    "assets/icons/tech_avatar3.png",
  ];
  @override
  Widget build(BuildContext context) {
    // Report side
    DateTime now = DateTime.now();
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);

    // Image selection task
    int num = random.nextInt(100);
    int loc = num % 3;

    Size s = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Reportsrcwidget.of(context)?.string = "${widget.username}",
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // color: widget.username == widget.selectedUser ? Color(0XFFFAFBFB) : white,
                color: widget.username == widget.selectedUser ? Colors.red.shade50 : white,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 2,
                      color: black.withOpacity(0.1))
                ],
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: s.height * 0.1,
                        height: s.height * 0.1,
                        child: Image.asset(
                          techimg[loc],
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: s.height * 0.02,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.name}",
                            style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
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
                                                        FontWeight.w500),
                                              )),
                                            )
                                          : Column(
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
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    textAlign: TextAlign.center,
                                                  )),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Row(
                                                  children: [
                                                    // const SizedBox(width: 4,),
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
                                                                .all(5.0),
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
                                                                .all(5.0),
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
                                                                .all(5.0),
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
                                                                .all(5.0),
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
                  Visibility(
                    visible: isSub,
                    child: Positioned(
                        left: s.width * 0.15,
                        bottom: 0,
                        child: Image.asset(
                          "assets/icons/check.png",
                          width: 30,
                          height: 30,
                        )),
                  )
                ],
              )),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> submit_validator() async {
    // Report side
    DateTime now = DateTime.now();
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);

    await fb
        .collection("Reports")
        .doc(year)
        .collection("Month")
        .doc(month)
        .collection(day)
        .doc("Tech")
        .collection("Reports")
        .doc(widget.username)
        .get()
        .then((DocumentSnapshot doc) {
      if (doc.exists) {
        try {
          bool nested = doc.get(FieldPath(const ['submit']));
          if (nested) {
            setState(() {
              isSub = true;
            });
          }
        } on StateError catch (e) {
          print('Feild is not exist error!');
        }
      }
    });
  }
}
