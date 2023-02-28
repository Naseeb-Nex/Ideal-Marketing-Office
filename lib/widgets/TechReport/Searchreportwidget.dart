import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'dart:math';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:test2/componets/vreportoverviewcard.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:test2/widgets/TechReport/Dailyreportwidget.dart';

// ignore: must_be_immutable
class Searchreportwidget extends StatefulWidget {
  Searchreportwidget({Key? key, this.username, this.techname})
      : super(key: key);

  String? techname;
  String? username;

  @override
  State<Searchreportwidget> createState() => _SearchreportwidgetState();
}

class _SearchreportwidgetState extends State<Searchreportwidget> {
  // data
  int a = 0;

  int c = 0;
  // Daily activity filter
  String daily_activity_filter = "all";

  // Date Picker
  late DateTime dateTime;

  bool date_selected = false;
  FirebaseFirestore fb = FirebaseFirestore.instance;
  String formated_month = "";
  bool is_datesub = false;
  int p = 0;
  int pro = 0;
// Images
  var random = Random();

  List<String> techimg = [
    "assets/icons/tech_avatar1.png",
    "assets/icons/tech_avatar2.png",
    "assets/icons/tech_avatar3.png",
  ];

  String? _selectedday;
  String? _selectedmonth;
  String? _selectedyear;

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
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: s.height * 0.02,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: s.height * 0.03),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: s.height * 0.025, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 4,
                            color: black.withOpacity(.08),
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Search",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: bluebg,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () async {
                              DateTime? newDateTime =
                                  await showRoundedDatePicker(
                                context: context,
                                locale: Locale('en', 'US'),
                                initialDate: DateTime.now(),
                                firstDate: DateTime(DateTime.now().year - 2),
                                lastDate: DateTime(DateTime.now().year + 1),
                                borderRadius: 20,
                                fontFamily: "Montserrat",
                                theme: ThemeData(
                                    primaryColor: bluebg,
                                    accentColor: bluebg,
                                    textTheme: TextTheme(
                                      caption: TextStyle(color: bluebg),
                                    ),
                                    accentTextTheme: TextTheme(
                                      bodyText2: TextStyle(color: bluebg),
                                    )),
                              );
                              if (newDateTime != null) {
                                setState(() {
                                  is_datesub = false;
                                  dateTime = newDateTime;
                                  date_selected = true;
                                  _selectedyear = "${dateTime.year}";
                                  _selectedmonth = "${dateTime.month}";
                                  _selectedday = "${dateTime.day}";
                                });
                                if (_selectedmonth?.length == 1) {
                                  setState(() {
                                    formated_month = "0$_selectedmonth";
                                  });
                                } else {
                                  formated_month = "$_selectedmonth";
                                }
                                fb
                                    .collection("Reports")
                                    .doc(_selectedyear)
                                    .collection("Month")
                                    .doc(formated_month)
                                    .collection(_selectedday!)
                                    .doc("Tech")
                                    .collection("Reports")
                                    .doc(widget.username)
                                    .get()
                                    .then((DocumentSnapshot doc) {
                                  if (doc.exists) {
                                    try {
                                      bool nested =
                                          doc.get(FieldPath(['submit']));
                                      if (nested) {
                                        setState(() {
                                          is_datesub = true;
                                        });
                                      }
                                    } on StateError catch (e) {
                                      print('Feild is not exist error!');
                                    }
                                  }
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: s.height * 0.03,
                                  horizontal: s.height * 0.03),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    color: black.withOpacity(.05),
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(
                                "Select the Date",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: date_selected
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: s.height * 0.02),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: s.height * 0.015,
                                  horizontal: s.height * 0.015),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 3,
                                    blurRadius: 4,
                                    color: black.withOpacity(.08),
                                    offset: const Offset(1, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            "Report",
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: bluebg,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "$_selectedday - $formated_month - $_selectedyear",
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17,
                                              color: bluebg,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 8,
                                  ),

                                  // Expense details
                                  Center(
                                    child: is_datesub
                                        ? Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: s.height * 0.02,
                                                    vertical: 5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        spreadRadius: 2,
                                                        blurRadius: 4,
                                                        color: black
                                                            .withOpacity(.05),
                                                        offset: Offset(1, 2),
                                                      ),
                                                    ]),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Image.asset(
                                                          "assets/icons/scooter.png",
                                                          width: 40,
                                                          height: 40,
                                                        ),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        const Text(
                                                          "Vehicle Details",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 17,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 5),
                                                    StreamBuilder<
                                                            QuerySnapshot>(
                                                        stream: fb
                                                            .collection(
                                                                "Reports")
                                                            .doc(_selectedyear)
                                                            .collection("Month")
                                                            .doc(formated_month)
                                                            .collection(
                                                                _selectedday!)
                                                            .doc("Tech")
                                                            .collection(
                                                                "Reports")
                                                            .doc(
                                                                "${widget.username}")
                                                            .collection(
                                                                "vehicle")
                                                            .snapshots(),
                                                        builder: (BuildContext
                                                                context,
                                                            AsyncSnapshot<
                                                                    QuerySnapshot>
                                                                snapshot) {
                                                          if (snapshot
                                                              .hasError) {}
                                                          if (snapshot
                                                                  .connectionState ==
                                                              ConnectionState
                                                                  .waiting) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width:
                                                                    s.height *
                                                                        0.25,
                                                                height:
                                                                    s.height *
                                                                        0.25,
                                                                child:
                                                                    LoadingIndicator(
                                                                  indicatorType:
                                                                      Indicator
                                                                          .ballClipRotateMultiple,
                                                                  colors: const [
                                                                    bluebg
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          }

                                                          final List vehicle =
                                                              [];
                                                          snapshot.data!.docs.map(
                                                              (DocumentSnapshot
                                                                  document) {
                                                            Map a = document
                                                                    .data()
                                                                as Map<String,
                                                                    dynamic>;
                                                            vehicle.add(a);
                                                            // a['uid'] = document.id;
                                                          }).toList();
                                                          return Column(
                                                            children: [
                                                              Container(
                                                                  child: vehicle
                                                                          .isEmpty
                                                                      ? Padding(
                                                                          padding:
                                                                              EdgeInsets.symmetric(horizontal: s.height * 0.01),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Column(
                                                                                children: [
                                                                                  Image.asset(
                                                                                    "assets/icons/warning.png",
                                                                                    height: s.height * 0.12,
                                                                                  ),
                                                                                  Text(
                                                                                    "No Vehicle Used !",
                                                                                    style: TextStyle(
                                                                                      fontFamily: "Montserrat",
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontSize: 17,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                      : null),
                                                              for (var i = 0;
                                                                  i <
                                                                      vehicle
                                                                          .length;
                                                                  i++) ...[
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              5.0),
                                                                  child:
                                                                      Vreportoverviewcard(
                                                                    name: vehicle[
                                                                            i][
                                                                        'name'],
                                                                    vdocname:
                                                                        vehicle[i]
                                                                            [
                                                                            'vdocname'],
                                                                    docname: vehicle[
                                                                            i][
                                                                        'docname'],
                                                                    username:
                                                                        vehicle[i]
                                                                            [
                                                                            'username'],
                                                                    update: vehicle[
                                                                            i][
                                                                        'upDate'],
                                                                    start: vehicle[
                                                                            i][
                                                                        'start'],
                                                                    end: vehicle[
                                                                            i]
                                                                        ['end'],
                                                                    desc: vehicle[
                                                                            i][
                                                                        'desc'],
                                                                    uptime: vehicle[
                                                                            i][
                                                                        'upTime'],
                                                                  ),
                                                                )
                                                              ]
                                                            ],
                                                          );
                                                        }),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: s.height * 0.02,
                                                    vertical: s.height * 0.02),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        spreadRadius: 2,
                                                        blurRadius: 4,
                                                        color: black
                                                            .withOpacity(.1),
                                                        offset:
                                                            const Offset(1, 2),
                                                      ),
                                                    ]),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Image.asset(
                                                          "assets/icons/expenses.png",
                                                          width: 40,
                                                          height: 40,
                                                        ),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          "Expense Details",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 17,
                                                            color: Colors.black87,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(),
                                                    SizedBox(height: 5),
                                                    FutureBuilder<
                                                        DocumentSnapshot>(
                                                      future: fb
                                                          .collection("Reports")
                                                          .doc(_selectedyear)
                                                          .collection("Month")
                                                          .doc(formated_month)
                                                          .collection(
                                                              _selectedday!)
                                                          .doc("Tech")
                                                          .collection("Reports")
                                                          .doc(
                                                              "${widget.username}")
                                                          .get(),
                                                      builder: (BuildContext
                                                              context,
                                                          AsyncSnapshot<
                                                                  DocumentSnapshot>
                                                              snapshot) {
                                                        if (snapshot.hasError) {
                                                          return Text(
                                                              "Something went wrong");
                                                        }

                                                        if (snapshot.hasData &&
                                                            !snapshot
                                                                .data!.exists) {
                                                          return Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        40),
                                                            child: Text(
                                                              "No data Found!",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Montserrat",
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          );
                                                        }

                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .done) {
                                                          Map<String, dynamic>
                                                              data = snapshot
                                                                      .data!
                                                                      .data()
                                                                  as Map<String,
                                                                      dynamic>;

                                                          return Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      "${data['expense']}",
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        fontSize:
                                                                            15,
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
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            color: white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                offset:
                                                                    const Offset(
                                                                        0, 10),
                                                                blurRadius: 20,
                                                                color: secondbg
                                                                    .withOpacity(
                                                                        0.23),
                                                              ),
                                                            ],
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        s.height *
                                                                            0.1),
                                                            child: Center(
                                                              child: SizedBox(
                                                                width:
                                                                    s.height *
                                                                        0.15,
                                                                height:
                                                                    s.height *
                                                                        0.15,
                                                                child:
                                                                    LoadingIndicator(
                                                                  indicatorType:
                                                                      Indicator
                                                                          .ballClipRotateMultiple,
                                                                  colors: const [
                                                                    black
                                                                  ],
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
                                              SizedBox(height: 15),
                                            ],
                                          )
                                        : Container(
                                            width: double.infinity,
                                            height: s.height * 0.27,
                                            child: Image.asset(
                                              "assets/icons/notsub.jpg",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),

                                  // Daily Activity
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: s.height * 0.01,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: s.height * 0.015,
                                          vertical: 15),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              spreadRadius: 2,
                                              blurRadius: 4,
                                              color: black.withOpacity(.1),
                                              offset: const Offset(0, 2),
                                            ),
                                          ]),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/icons/test.png",
                                            width: 40,
                                            height: 40,
                                          ),
                                          Text(
                                            "Daily Activity",
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17,
                                              color: bluebg,
                                            ),
                                          ),
                                          Divider(),
                                          SizedBox(height: 15),
                                          StreamBuilder<QuerySnapshot>(
                                            stream: fb
                                                .collection("Reports")
                                                .doc(_selectedyear)
                                                .collection("Month")
                                                .doc(formated_month)
                                                .collection(_selectedday!)
                                                .doc("Tech")
                                                .collection("Reports")
                                                .doc("${widget.username}")
                                                .collection("Activity")
                                                .snapshots(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<QuerySnapshot>
                                                    snapshot) {
                                              if (snapshot.hasError) {
                                                return Column(
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      height: s.height * 0.27,
                                                      child: Image.asset(
                                                        "assets/icons/noprograms.jpg",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10),
                                                      child: Text(
                                                        "No Programs Found !",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Montserrat",
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: s.height * 0.03),
                                                    child: SizedBox(
                                                      width: s.height * 0.25,
                                                      height: s.height * 0.25,
                                                      child: LoadingIndicator(
                                                        indicatorType: Indicator
                                                            .ballClipRotateMultiple,
                                                        colors: const [bluebg],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }

                                              final List activityrp = [];
                                              List filtered_activity = [];
                                              snapshot.data!.docs.map(
                                                  (DocumentSnapshot document) {
                                                Map a = document.data()
                                                    as Map<String, dynamic>;
                                                activityrp.add(a);
                                              }).toList();

                                              if (daily_activity_filter ==
                                                  "all") {
                                                filtered_activity = activityrp;
                                              } else {
                                                filtered_activity = activityrp
                                                    .where((i) =>
                                                        i['status'] ==
                                                        daily_activity_filter)
                                                    .toList();
                                              }

                                              return Column(
                                                children: [
                                                  Container(
                                                    child:
                                                        activityrp.length == 0
                                                            ? Column(
                                                                children: [
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        s.height *
                                                                            0.27,
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/icons/noprograms.jpg",
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        vertical:
                                                                            10),
                                                                    child: Text(
                                                                      "No Programs Found !",
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            : Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap: () =>
                                                                              setState(() {
                                                                            daily_activity_filter =
                                                                                "all";
                                                                          }),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                s.height * 0.15,
                                                                            padding:
                                                                                EdgeInsets.symmetric(
                                                                              vertical: s.height * 0.015,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "all" ? bluebg : nonactivebg),
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                "All",
                                                                                style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "all" ? white : nonactivetxt),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                s.height * 0.03),
                                                                        InkWell(
                                                                          onTap: () =>
                                                                              setState(() {
                                                                            daily_activity_filter =
                                                                                "assigned";
                                                                          }),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                s.height * 0.25,
                                                                            padding:
                                                                                EdgeInsets.symmetric(
                                                                              vertical: s.height * 0.015,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "assigned" ? bluebg : nonactivebg),
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                "Assigned",
                                                                                style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "assigned" ? white : nonactivetxt),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                s.height * 0.03),
                                                                        InkWell(
                                                                          onTap: () =>
                                                                              setState(() {
                                                                            daily_activity_filter =
                                                                                "pending";
                                                                          }),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                s.height * 0.25,
                                                                            padding:
                                                                                EdgeInsets.symmetric(
                                                                              vertical: s.height * 0.015,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "pending" ? bluebg : nonactivebg),
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                "Pending",
                                                                                style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "pending" ? white : nonactivetxt),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                s.height * 0.03),
                                                                        InkWell(
                                                                          onTap: () =>
                                                                              setState(() {
                                                                            daily_activity_filter =
                                                                                "completed";
                                                                          }),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                s.height * 0.25,
                                                                            padding:
                                                                                EdgeInsets.symmetric(
                                                                              vertical: s.height * 0.015,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "completed" ? bluebg : nonactivebg),
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                "Completed",
                                                                                style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "completed" ? white : nonactivetxt),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                s.height * 0.03),
                                                                        InkWell(
                                                                          onTap: () =>
                                                                              setState(() {
                                                                            daily_activity_filter =
                                                                                "processing";
                                                                          }),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                s.height * 0.25,
                                                                            padding:
                                                                                EdgeInsets.symmetric(
                                                                              vertical: s.height * 0.015,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "processing" ? bluebg : nonactivebg),
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                "Processing",
                                                                                style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "processing" ? white : nonactivetxt),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                ],
                                                              ),
                                                  ),
                                                  Container(
                                                    child: activityrp.length ==
                                                            0
                                                        ? null
                                                        : Container(
                                                            child: filtered_activity
                                                                        .length ==
                                                                    0
                                                                ? Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: s.height *
                                                                            0.1),
                                                                    child: SizedBox(
                                                                        height: s.height *
                                                                            0.4,
                                                                        width: s.height *
                                                                            0.4,
                                                                        child: Image.asset(
                                                                            "assets/icons/no_result.png")),
                                                                  )
                                                                : null),
                                                  ),
                                                  for (var i = 0;
                                                      i <
                                                          filtered_activity
                                                              .length;
                                                      i++) ...[
                                                    Activitywrapper(
                                                      name: filtered_activity[i]
                                                          ['name'],
                                                      address:
                                                          filtered_activity[i]
                                                              ['address'],
                                                      loc: filtered_activity[i]
                                                          ['loc'],
                                                      phn: filtered_activity[i]
                                                          ['phn'],
                                                      pgm: filtered_activity[i]
                                                          ['pgm'],
                                                      chrg: filtered_activity[i]
                                                          ['chrg'],
                                                      type: filtered_activity[i]
                                                          ['type'],
                                                      upDate:
                                                          filtered_activity[i]
                                                              ['upDate'],
                                                      upTime:
                                                          filtered_activity[i]
                                                              ['upTime'],
                                                      docname:
                                                          filtered_activity[i]
                                                              ['docname'],
                                                      status:
                                                          filtered_activity[i]
                                                              ['status'],
                                                      username:
                                                          filtered_activity[i]
                                                              ['username'],
                                                      techname:
                                                          filtered_activity[i]
                                                              ['techname'],
                                                      assignedtime:
                                                          filtered_activity[i]
                                                              ['assignedtime'],
                                                      assigneddate:
                                                          filtered_activity[i]
                                                              ['assigneddate'],
                                                      priority:
                                                          filtered_activity[i]
                                                              ['priority'],
                                                      camount:
                                                          filtered_activity[i]
                                                              ['camount'],
                                                      remarks:
                                                          filtered_activity[i]
                                                              ['remarks'],
                                                      cdate:
                                                          filtered_activity[i]
                                                              ['cdate'],
                                                      ctime:
                                                          filtered_activity[i]
                                                              ['ctime'],
                                                      ccollname:
                                                          filtered_activity[i]
                                                              ['ccollname'],
                                                      cdocname:
                                                          filtered_activity[i]
                                                              ['cdocname'],
                                                      custdocname:
                                                          filtered_activity[i]
                                                              ['custdocname'],
                                                      rpdocname:
                                                          filtered_activity[i]
                                                              ['rpdocname'],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                  Container(
                                                      child:
                                                          activityrp.length == 0
                                                              ? null
                                                              : Container(
                                                                  child: filtered_activity
                                                                              .length ==
                                                                          0
                                                                      ? SizedBox(
                                                                          height: s.height *
                                                                              0.12)
                                                                      : SizedBox(
                                                                          height:
                                                                              s.height * 0.05),
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
                            ),
                          )
                        : null,
                  ),
                  SizedBox(height: s.height * 0.02),
                ],
              ),
            ],
          ),
        ));
  }
}
