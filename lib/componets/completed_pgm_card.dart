import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';

// ignore: must_be_immutable
class Completedpgmcard extends StatefulWidget {
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
  String? prospec;
  String? instadate;
  String? remarks;
  String? ctime;
  String? cdate;
  String? camount;
  String? tname;
  String? custdocname;

  Completedpgmcard({
    Key? key,
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
    this.cdate,
    this.ctime,
    this.camount,
    this.tname,
    this.custdocname,
  }) : super(key: key);

  @override
  State<Completedpgmcard> createState() => _CompletedpgmcardState();
}

class _CompletedpgmcardState extends State<Completedpgmcard> {
  bool vis = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.name}",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${widget.address}",
                      style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 16,
                          color: Colors.black54),
                    ),
                    Text(
                      "${widget.loc}",
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 15,
                          color: Colors.black45,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.pgm}",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "${widget.phn}",
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 15,
                          color: Colors.black54),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "${widget.upDate}",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "${widget.upTime}",
                          style: const TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 15,
                          ),
                        ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: bluebg),
                          child: const Text(
                            "Completed",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: white,
                            ),
                          ),
                        ),  
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Done by : ${widget.tname}",
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                  ),
                ),
                Text(
                  "${widget.remarks}",
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Date : ${widget.cdate}",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Time : ${widget.ctime}",
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () => setState(() {
                            vis = !vis;
                          }),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      color: Colors.black.withOpacity(0.1),
                                      // offset: const Offset(0, 5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.all(2),
                              child: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black38,
                              )),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            Visibility(
              visible: vis,
              child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: bluebg,
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              "${widget.type}",
                              style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 15,
                                  color: white),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${widget.prospec}",
                            style: const TextStyle(
                                fontFamily: "Montserrat", fontSize: 17),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${widget.instadate}",
                            style: const TextStyle(
                                fontFamily: "Montserrat", fontSize: 17),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[400]),
                              child: Row(
                                children: [
                                  const Text(
                                    "Collection",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      color: white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    " ${widget.camount} / ${widget.chrg}",
                                    style: const TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}