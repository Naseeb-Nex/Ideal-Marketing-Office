import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';

// ignore: must_be_immutable
class CustomerHistorycard extends StatefulWidget {
  String? upDate;
  String? upTime;
  String? docname;
  String? custdocname ;
  String? status;
  String? msg;
  String? techname;
  String? camount;
  String? remarks;

  CustomerHistorycard(
      {Key? key,
      this.techname,
      this.msg,
      this.camount,
      this.remarks,
      this.upDate,
      this.upTime,
      this.docname,
      this.custdocname,
      this.status,})
      : super(key: key);

  @override
  State<CustomerHistorycard> createState() => _CustomerHistorycardState();
}

class _CustomerHistorycardState extends State<CustomerHistorycard> {
  List _pgmhistory = [];
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 5,
              color: secondbg.withOpacity(0.18),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "${widget.upDate}",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${widget.upTime}",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Text(
                  "${widget.msg}",
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: redbg,
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 4,
                                color: black.withOpacity(0.1),
                                offset: const Offset(0, 5))
                          ]),
                      child: Text(
                        "${widget.status}",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          color: Color(0XFFE64639),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
