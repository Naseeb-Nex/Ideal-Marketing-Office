import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';

import 'package:test2/services/pgm.dart';

class PendingTechcard extends StatelessWidget {
  String? uid;
  String? username;
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? type;
  String? chrg;
  String? pgm;
  String? upDate;
  String? upTime;
  String? docname;
  String? remarks;
  String? ptime;
  String? pdate;

  PendingTechcard({
    Key? key,
    this.uid,
    this.username,
    this.name,
    this.address,
    this.loc,
    this.phn,
    this.type,
    this.chrg,
    this.pgm,
    this.upDate,
    this.upTime,
    this.docname,
    this.remarks,
    this.pdate,
    this.ptime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Container(
        height: 220,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 5,
              color: secondbg.withOpacity(0.18),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      child: Text(
                        "$name",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "$address",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "$pgm",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: Text(
                        "$upDate",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "$upTime",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.pin_drop_outlined,
                        color: cheryred,
                      ),
                      Container(
                        child: Text(
                          "  $loc",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Type : $type",
                          style: const TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 20,
                            color: Color(0xFF0e2f44),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Icon(
                        Icons.phone_android,
                        color: Color(0xFF008080),
                      ),
                      Container(
                        child: Text(
                          "  $phn",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF008080),
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ConfirmBox(
                              username: username,
                              name: name,
                              address: address,
                              loc: loc,
                              phn: phn,
                              type: type,
                              chrg: chrg,
                              pgm: pgm,
                              upDate: upDate,
                              upTime: upTime,
                              docname: docname,
                            );
                          });
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent),
                      child: Center(
                        child: Text(
                          "Convert",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      "Remarks : ",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "$remarks",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Text(
                        "Completed Date : $ptime",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Completed Time :  $pdate",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ConfirmBox extends StatelessWidget {
  String? username;
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? type;
  String? chrg;
  String? pgm;
  String? upDate;
  String? upTime;
  String? docname;
  ConfirmBox({
    this.username,
    this.name,
    this.address,
    this.loc,
    this.phn,
    this.type,
    this.chrg,
    this.pgm,
    this.upDate,
    this.upTime,
    this.docname,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.greenAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 300,
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: primarybg,
                    size: 30,
                  ),
                  Text(
                    "Confirm",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Do you want to convert to Main List?",
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30,),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: white),
                    child: Center(
                      child: Text(
                        "Okay",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
