// ignore: file_names
import 'package:flutter/material.dart';
import 'package:test2/componets/monthly_status.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class MonthlyReportWidget extends StatefulWidget {
  MonthlyReportWidget({Key? key, this.username, this.techname})
      : super(key: key);

  String? techname;
  String? username;

  @override
  State<MonthlyReportWidget> createState() => _MonthlyReportWidgetState();
}

class _MonthlyReportWidgetState extends State<MonthlyReportWidget> {
  // Monthly List
  // ignore: non_constant_identifier_names
  List Monthly_filtered_rp = [];

  // ignore: non_constant_identifier_names
  List Monthly_search_rs = [];

  // data
  int a = 0;

  int c = 0;
  // Daily activity filter
  // ignore: non_constant_identifier_names
  String daily_activity_filter = "all";

  // Date Picker
  late DateTime dateTime;

  // ignore: non_constant_identifier_names
  bool date_selected = false;

  FirebaseFirestore fb = FirebaseFirestore.instance;
  // ignore: non_constant_identifier_names
  String formated_month = "";

  // ignore: non_constant_identifier_names
  bool is_datesub = false;

  int p = 0;
  int pro = 0;
  // serach controller
  final searchController = TextEditingController();

  // SearchBOx
  Widget searchBox() {
    return Container(
      padding: const  EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: const  Color(0xffE2EAFC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: searchController,
        onChanged: (value) => _runFilter(value),
        decoration: const  InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          prefixIcon: Icon(
            Icons.search,
            color: black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.blueGrey),
        ),
      ),
    );
  }

  void _runFilter(String enteredKeyword) {
    setState(() {
      Monthly_search_rs = Monthly_filtered_rp.where((pgm) {
        final nameLower = pgm["name"]!.toLowerCase();
        final dayLower = pgm["day"]!.toLowerCase();
        final pgmLower = pgm["pgm"]!.toLowerCase();
        final phnumber = pgm["phn"]!;
        final searchquery = enteredKeyword.toLowerCase();

        return nameLower.contains(searchquery) ||
            dayLower.contains(searchquery) ||
            pgmLower.contains(searchquery) ||
            phnumber.contains(searchquery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    // Report side
    DateTime now = DateTime.now();
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);

    return SizedBox(
        height: s.height * 0.8,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: s.height * 0.02, vertical: s.height * 0.03),
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
                    color: black.withOpacity(.1),
                    offset: const Offset(1, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  const [
   Text(
                        "Monthly Report",
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
                  const  SizedBox(height: 10),
                  searchBox(),
                   const SizedBox(height: 10),
                  StreamBuilder<QuerySnapshot>(
                    stream: fb
                        .collection("Reports")
                        .doc(year)
                        .collection("Month")
                        .doc(month)
                        .collection("summary")
                        .where("username", isEqualTo: "${widget.username}")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: s.height * 0.27,
                              child: Image.asset(
                                "assets/icons/noprograms.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                             const Padding(
                              padding:
                                   EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "No Programs Found !",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
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
          
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map a = document.data() as Map<String, dynamic>;
                        activityrp.add(a);
                      }).toList();
          
                      if (daily_activity_filter == "all") {
                        Monthly_filtered_rp = activityrp;
                      } else {
                        Monthly_filtered_rp = activityrp
                            .where(
                                (i) => i['status'] == daily_activity_filter)
                            .toList();
                      }
          
                      if (searchController.text.isEmpty) {
                        Monthly_search_rs = Monthly_filtered_rp;
                      }
                      return Column(
                        children: [
                          Container(
                            child: activityrp.isEmpty
                                ? Padding(
                                  padding:  EdgeInsets.symmetric(vertical : s.height * 0.15),
                                  child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/icons/noprograms.jpg",width: s.height * 0.3,
                                        height: s.height * 0.27,
                                          fit: BoxFit.contain,
                                        ),
                                       const   Padding(
                                          padding:  EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            "No Programs Found !",
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
                                                daily_activity_filter = "all";
                                              }),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: s.height * 0.01,
                                                  horizontal: s.height * 0.04
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        daily_activity_filter ==
                                                                "all"
                                                            ? bluebg
                                                            : nonactivebg),
                                                child: Column(
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        "All",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                            color: daily_activity_filter ==
                                                                    "all"
                                                                ? white
                                                                : nonactivetxt),
                                                      ),
                                                    ),
                                                    const  SizedBox(height: 4),
                                                    Container(
                                                        child:
                                                            daily_activity_filter ==
                                                                    "all"
                                                                ? Text(
                                                                    "${Monthly_search_rs.length}",
                                                                    style: const  TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        color:
                                                                            white),
                                                                  )
                                                                : null),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: s.height * 0.03),
                                            InkWell(
                                              onTap: () => setState(() {
                                                daily_activity_filter =
                                                    "assigned";
                                              }),
                                              child: Container(
                                                width: s.height * 0.25,
                                                padding: EdgeInsets.symmetric(
                                                  vertical: s.height * 0.015,
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        daily_activity_filter ==
                                                                "assigned"
                                                            ? bluebg
                                                            : nonactivebg),
                                                child: Column(
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        "Assigned",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                            color: daily_activity_filter ==
                                                                    "assigned"
                                                                ? white
                                                                : nonactivetxt),
                                                      ),
                                                    ),
                                                    const  SizedBox(height: 4),
                                                    Container(
                                                        child:
                                                            daily_activity_filter ==
                                                                    "assigned"
                                                                ? Text(
                                                                    "${Monthly_search_rs.length}",
                                                                    style:  const TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        color:
                                                                            white),
                                                                  )
                                                                : null),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: s.height * 0.03),
                                            InkWell(
                                              onTap: () => setState(() {
                                                daily_activity_filter =
                                                    "pending";
                                              }),
                                              child: Container(
                                                width: s.height * 0.25,
                                                padding: EdgeInsets.symmetric(
                                                  vertical: s.height * 0.015,
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        daily_activity_filter ==
                                                                "pending"
                                                            ? bluebg
                                                            : nonactivebg),
                                                child: Column(
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        "Pending",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                            color: daily_activity_filter ==
                                                                    "pending"
                                                                ? white
                                                                : nonactivetxt),
                                                      ),
                                                    ),
                                                  const    SizedBox(height: 4),
                                                    Container(
                                                        child:
                                                            daily_activity_filter ==
                                                                    "pending"
                                                                ? Text(
                                                                    "${Monthly_search_rs.length}",
                                                                    style:  const TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        color:
                                                                            white),
                                                                  )
                                                                : null),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: s.height * 0.03),
                                            InkWell(
                                              onTap: () => setState(() {
                                                daily_activity_filter =
                                                    "completed";
                                              }),
                                              child: Container(
                                                width: s.height * 0.25,
                                                padding: EdgeInsets.symmetric(
                                                  vertical: s.height * 0.015,
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        daily_activity_filter ==
                                                                "completed"
                                                            ? bluebg
                                                            : nonactivebg),
                                                child: Column(
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        "Completed",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                            color: daily_activity_filter ==
                                                                    "completed"
                                                                ? white
                                                                : nonactivetxt),
                                                      ),
                                                    ),
                                                    const  SizedBox(height: 4),
                                                    Container(
                                                        child:
                                                            daily_activity_filter ==
                                                                    "completed"
                                                                ? Text(
                                                                    "${Monthly_search_rs.length}",
                                                                    style:  const TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        color:
                                                                            white),
                                                                  )
                                                                : null),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: s.height * 0.03),
                                            InkWell(
                                              onTap: () => setState(() {
                                                daily_activity_filter =
                                                    "processing";
                                              }),
                                              child: Container(
                                                width: s.height * 0.25,
                                                padding: EdgeInsets.symmetric(
                                                  vertical: s.height * 0.015,
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        daily_activity_filter ==
                                                                "processing"
                                                            ? bluebg
                                                            : nonactivebg),
                                                child: Column(
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        "Processing",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                            color: daily_activity_filter ==
                                                                    "processing"
                                                                ? white
                                                                : nonactivetxt),
                                                      ),
                                                    ),
                                                   const   SizedBox(height: 4),
                                                    Container(
                                                        child:
                                                            daily_activity_filter ==
                                                                    "processing"
                                                                ? Text(
                                                                    "${Monthly_search_rs.length}",
                                                                    style:  const TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        color:
                                                                            white),
                                                                  )
                                                                : null),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                     const   SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                          ),
                          Container(
                            child: activityrp.isEmpty
                                ? null
                                : Container(
                                    child: Monthly_search_rs.isEmpty
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                                top: s.height * 0.15),
                                            child: Image.asset(
                                              "assets/icons/no_result.png",
                                              height: s.height * 0.4,
                                              width: s.height * 0.4,
                                              fit: BoxFit.contain,
                                            ),
                                          )
                                        : null),
                          ),
                          for (var i = 0;
                              i < Monthly_search_rs.length;
                              i++) ...[
                            Montlystatus(
                              name: Monthly_search_rs[i]['name'],
                              phn: Monthly_search_rs[i]['phn'],
                              pgm: Monthly_search_rs[i]['pgm'],
                              upDate: Monthly_search_rs[i]['upDate'],
                              upTime: Monthly_search_rs[i]['upTime'],
                              docname: Monthly_search_rs[i]['docname'],
                              status: Monthly_search_rs[i]['status'],
                              username: Monthly_search_rs[i]['username'],
                              techname: Monthly_search_rs[i]['techname'],
                              more: Monthly_search_rs[i]['more'],
                              month: Monthly_search_rs[i]['month'],
                              day: Monthly_search_rs[i]['day'],
                            ),
                            const  SizedBox(
                              height: 10,
                            ),
                          ],
                          Container(
                              child: activityrp.isEmpty
                                  ? null
                                  : Container(
                                      child: Monthly_search_rs.isEmpty
                                          ? SizedBox(height: s.height * 0.12)
                                          : SizedBox(height: s.height * 0.05),
                                    ))
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
