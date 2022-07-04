import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test2/componets/customer_history_card.dart';
import 'package:test2/constants/constants.dart';

// ignore: must_be_immutable
class Customerpgmview extends StatefulWidget {
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? type;
  String? pgm;
  String? upDate;
  String? upTime;
  String? docname;
  String? prospec;
  String? instadate;
  String? status;
  String? custdocname;
  String? chrg;

  Customerpgmview(
      {Key? key,
      this.name,
      this.address,
      this.loc,
      this.phn,
      this.type,
      this.pgm,
      this.upDate,
      this.upTime,
      this.docname,
      this.prospec,
      this.instadate,
      this.custdocname,
      this.chrg,
      this.status})
      : super(key: key);

  @override
  State<Customerpgmview> createState() => _CustomerpgmviewState();
}

class _CustomerpgmviewState extends State<Customerpgmview> {
  bool vis = false;
  List _pgmhistory = [];
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
          color: widget.status == "completed" ? greenbg : redbg,
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
                Column(
                  children: [
                    Text(
                      "${widget.pgm}",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[400]),
                              child: Row(
                                children: [
                                  const Text(
                                    "Collection : ",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      color: white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text("${widget.chrg}",
                                    style: const TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                  ],
                ),
                Row(
                  children: [
                    Center(
                      child: widget.status == "pending" ?
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
                      ) : null,
                    ),
                    Center(
                      child: widget.status == "processing" ?
                      Container(
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
                      ) : null,
                    ),
                    Center(
                      child: widget.status == "assigned" ?
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0XFFEBF9F4),
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
                            color: Color(0XFFFFC444),
                          ),
                        ),
                      ) : null,
                    ),
                    Center(
                      child: widget.status == "completed" ?
                      Container(
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
                      ) : null,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        vis = !vis;
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                                widget.status == "completed" ? greenbg : redbg,
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
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Visibility(
              visible: vis,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15,),
                child: Column(
                  children: [
                    const Text(
                      "Histroy",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 3,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black45),
                    ),
                    const SizedBox(height: 10,),
                    StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Customer')
                      .doc(widget.custdocname)
                      .collection("Programs")
                      .doc(widget.docname)
                      .collection("History")
                      .orderBy("docname", descending: true)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print('Something went Wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: bluebg,
                        ),
                      );
                    }

                    _pgmhistory.clear();
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map a = document.data() as Map<String, dynamic>;
                      _pgmhistory.add(a);
                      a['uid'] = document.id;
                    }).toList();

                    return Column(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        for (var i = 0; i < _pgmhistory.length; i++) ...[
                          CustomerHistorycard(
                            custdocname: _pgmhistory[i]["custdocname"],
                            msg: _pgmhistory[i]["msg"],
                            upDate: _pgmhistory[i]["upDate"],
                            upTime: _pgmhistory[i]["upTime"],
                            docname: _pgmhistory[i]["docname"],
                            status: _pgmhistory[i]["status"],
                            remarks: _pgmhistory[i]["remarks"],
                          )
                        ]
                      ],
                    );
                  })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
