import 'dart:math';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';
// icons
import 'package:iconsax/iconsax.dart';
import 'package:test2/services/reportdata.dart';

// loading_indicator
import 'package:loading_indicator/loading_indicator.dart';
import 'package:test2/widgets/TechReport/Dailyreportwidget.dart';

// ignore: must_be_immutable
class Montlystatus extends StatefulWidget {
  String? upDate;
  String? upTime;
  String? docname;
  String? status;
  String? techname;
  String? name;
  String? phn;
  String? pgm;
  String? month;
  String? day;
  String? more;
  String? username;

  Montlystatus({
    Key? key,
    this.techname,
    this.name,
    this.pgm,
    this.upDate,
    this.upTime,
    this.docname,
    this.phn,
    this.status,
    this.month,
    this.day,
    this.more,
    this.username,
  }) : super(key: key);

  @override
  State<Montlystatus> createState() => _MontlystatusState();
}

class _MontlystatusState extends State<Montlystatus> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  bool _isviz = false;

  //  Random data
  var random = Random();

  // Cutomer Image array
  List<String> custimg = [
    "assets/icons/customer1.jpg",
    "assets/icons/customer2.jpg",
    "assets/icons/customer4.jpg",
  ];

  // Image loc
  int loc = 0;

  // Activity Report
  Reportdata rpdata = Reportdata();

  @override
  void initState() {
    super.initState();
    // Random Image loc
    int num = random.nextInt(100);
    loc = num % 3;

       // year extraction
    if (widget.day?.length == 1) {
      year = widget.more!.substring(5, 9);
    } else {
      year = widget.more!.substring(6, 10);
    }
  }

  String? year;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Column(
      children: [
        InkWell(
          onTap: () => {
            setState(() {
              _isviz = !_isviz;
            })
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
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
            child: FutureBuilder<DocumentSnapshot>(
              future: fb
                  .collection("Reports")
                  .doc(year)
                  .collection("Month")
                  .doc(widget.month)
                  .collection(widget.day!)
                  .doc("Tech")
                  .collection("Reports")
                  .doc("${widget.username}")
                  .collection("Activity")
                  .doc(widget.more)
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
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
                        padding: EdgeInsets.symmetric(vertical: s.width * 0.02),
                        child: Image.asset(
                          "assets/icons/file_miss.png",
                          width: s.width * 0.4,
                          height: s.width * 0.4,
                        )),
                  );
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return Activitywrapper(
                    name: data['name'],
                    address: data['address'],
                    loc: data['loc'],
                    phn: data['phn'],
                    pgm: data['pgm'],
                    chrg: data['chrg'],
                    type: data['type'],
                    upDate: data['upDate'],
                    upTime: data['upTime'],
                    docname: data['docname'],
                    status: data['status'],
                    username: data['username'],
                    techname: data['techname'],
                    assignedtime: data['assignedtime'],
                    assigneddate: data['assigneddate'],
                    priority: data['priority'],
                    camount: data['camount'],
                    remarks: data['remarks'],
                    cdate: data['cdate'],
                    ctime: data['ctime'],
                    ccollname: data['ccollname'],
                    cdocname: data['cdocname'],
                    custdocname: data['custdocname'],
                    rpdocname: data['rpdocname'],
                  );
                }

                return Container(
                  width: MediaQuery.of(context).size.width,
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
                    padding: EdgeInsets.symmetric(vertical: s.width * 0.1),
                    child: Center(
                      child: SizedBox(
                        width: s.width * 0.15,
                        height: s.width * 0.15,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballClipRotateMultiple,
                          colors: const [bluebg],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget statuswrapper(String status, Size s) {
    if (status == "pending") {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: s.width * 0.03, vertical: s.width * 0.03),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: redbg,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 2,
                    color: black.withOpacity(0.05),
                    offset: const Offset(0, 5))
              ]),
          child: Text(
            "${widget.status}",
            style: const TextStyle(
              fontFamily: "Montserrat",
              fontSize: 15,
              color: redfg,
            ),
          ),
        ),
      );
    } else if (status == "completed") {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: s.width * 0.03, vertical: s.width * 0.03),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: greenbg,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 2,
                    color: black.withOpacity(0.05),
                    offset: const Offset(0, 5))
              ]),
          child: Text(
            "${widget.status}",
            style: const TextStyle(
              fontFamily: "Montserrat",
              fontSize: 15,
              color: Colors.green,
            ),
          ),
        ),
      );
    } else if (status == "processing") {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: s.width * 0.03, vertical: s.width * 0.03),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: vybg,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 2,
                    color: black.withOpacity(0.05),
                    offset: const Offset(0, 5))
              ]),
          child: Text(
            "${widget.status}",
            style: const TextStyle(
              fontFamily: "Montserrat",
              fontSize: 15,
              color: Colors.blue,
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: s.width * 0.03, vertical: s.width * 0.03),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: yellowbg,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  color: black.withOpacity(0.05),
                  offset: const Offset(0, 5))
            ]),
        child: Text(
          "${widget.status}",
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontSize: 15,
            color: yellowfg,
          ),
        ),
      ),
    );
  }
}
