import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';

// ignore: must_be_immutable
class Techhistorycard extends StatefulWidget {
  String? name;
  String? loc;
  String? pgm;
  String? chrg;
  String? upDate;
  String? upTime;
  String? docname;
  String? status;
  String? remarks;
  String? collection;
  String? username;

  Techhistorycard({
    Key? key,
    this.name,
    this.loc,
    this.pgm,
    this.chrg,
    this.upDate,
    this.upTime,
    this.docname,
    this.status,
    this.remarks,
    this.collection,
    this.username,
  }) : super(key: key);

  @override
  State<Techhistorycard> createState() => _TechhistorycardState();
}

class _TechhistorycardState extends State<Techhistorycard> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: s.width * 0.15,
                    child: Text(
                      "${widget.name}",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${widget.loc}",
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: s.width * 0.4,
                  child: Text(
                    "${widget.pgm}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat",
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: widget.remarks == null
                      ? null
                      : Text(
                          "Remarks : ${widget.remarks}",
                          style: const TextStyle(
                            // fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                            fontSize: 14,
                          ),
                        ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: widget.collection == null
                      ? null
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: limegreen,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          child: Text(
                            "Collection : ${widget.chrg} / ${widget.collection}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                color: white),
                          ),
                        ),
                )
              ],
            ),
            Column(
              children: [
                Center(
                  child: widget.status == "pending"
                      ? Container(
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
                              color: redfg,
                            ),
                          ),
                        )
                      : null,
                ),
                Center(
                  child: widget.status == "completed"
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: greenbg,
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
                              color: Colors.green,
                            ),
                          ),
                        )
                      : null,
                ),
                Center(
                  child: widget.status == "assigned"
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: yellowbg,
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
                              color: yellowfg,
                            ),
                          ),
                        )
                      : null,
                ),
                Center(
                  child: widget.status == "processing"
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: vybg,
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
                              color: Colors.blue,
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.upDate}",
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "${widget.upTime}",
                  style: const TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
