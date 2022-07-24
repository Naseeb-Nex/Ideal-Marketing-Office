import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/services/assignedpgmdata.dart';
import 'package:intl/intl.dart';
import 'package:test2/services/customer_history.dart';
import 'package:test2/services/history.dart';

class Assignpgmcard extends StatefulWidget {
  String? uid;
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? type;
  String? pgm;
  String? upDate;
  String? upTime;
  String? techuid;
  String? docname;
  String? username;
  String? chrg;
  String? priority;
  String? techname;
  String? prospec;
  String? instadate;
  String? custdocname;

  Assignpgmcard({
    Key? key,
    this.uid,
    this.name,
    this.address,
    this.loc,
    this.phn,
    this.type,
    this.pgm,
    this.upDate,
    this.upTime,
    this.docname,
    this.techuid,
    this.username,
    this.chrg,
    this.techname,
    this.prospec,
    this.instadate,
    this.custdocname,
  }) : super(key: key);

  @override
  _AssignpgmcardState createState() => _AssignpgmcardState();
}

class _AssignpgmcardState extends State<Assignpgmcard> {
  final _controller = TextEditingController();
  final _priorityKey = GlobalKey<FormState>();
  bool _up = false;
  bool error = false;
  bool loading = false;
  bool vis = false;

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
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 5,
              color: secondbg.withOpacity(0.18),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
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
                        Row(
                          children: [
                            Text(
                              "${widget.loc}",
                              style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
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
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: s.width * 0.45,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Center(
                            child: Text(
                              "${widget.pgm}",
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
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
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                            )
                          ],
                        ),
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
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Row(
                            children: [
                              Text(
                                "Set Priority :   ",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: _up == true
                                      ? Colors.greenAccent
                                      : Colors.redAccent,
                                ),
                              ),
                              Container(
                                width: 40,
                                alignment: Alignment.center,
                                child: Form(
                                  key: _priorityKey,
                                  child: TextFormField(
                                    autofocus: false,
                                    controller: _controller,
                                    onSaved: (value) {
                                      _controller.text = value!;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        error = true;
                                        return null;
                                      }
                                      error = false;
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => uploadpgmdata(),
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: _up == true
                                        ? Colors.greenAccent
                                        : Colors.redAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.done,
                                    color: white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Visibility(
                visible: loading,
                child: const CircularProgressIndicator(
                  color: bluebg,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void uploadpgmdata() async {
    FirebaseFirestore fb = FirebaseFirestore.instance;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM d y kk:mm:ss').format(now);
    String assigneddate = DateFormat('d MMM y').format(now);
    String assignedtime = DateFormat('kk:mm').format(now);

    Assignpgmdata apgm = Assignpgmdata(
      uid: widget.uid,
      name: widget.name,
      address: widget.address,
      loc: widget.loc,
      phn: widget.phn,
      pgm: widget.pgm,
      chrg: widget.chrg,
      type: widget.type,
      upDate: widget.upDate,
      upTime: widget.upTime,
      docname: widget.docname,
      prospec: widget.prospec,
      instadate: widget.instadate,
      status: "pending",
      username: widget.username,
      techname: widget.techname,
      priority: _controller.text,
      assigneddate: assigneddate,
      assignedtime: assignedtime,
      custdocname: widget.custdocname,
    );

    CustomerPgmHistory custhistory = CustomerPgmHistory(
        upDate: assigneddate,
        upTime: assignedtime,
        msg: "Program Assigned to ${widget.techname}",
        techname: widget.techname,
        status: "assigned",
        docname: formattedDate,
        custdocname: widget.custdocname);

    Pgmhistory history = Pgmhistory(
      name: widget.name,
      address: widget.address,
      loc: widget.loc,
      phn: widget.phn,
      pgm: widget.pgm,
      chrg: widget.chrg,
      type: widget.type,
      upDate: assigneddate,
      upTime: assignedtime,
      docname: formattedDate,
      prospec: widget.prospec,
      instadate: widget.instadate,
      status: "assigned",
      ch: "Program Assigned",
      techname: widget.techname,
    );

    if (_priorityKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

// Update the Program status
      fb
          .collection("Programs")
          .doc(widget.docname)
          .update({'status': 'assigned'}).then((value) {
        print("Updated as assigned");
      }).catchError((error) => print("Failed to update program : $error"));

      
      // Updating the Customer program status
      fb
          .collection("Customer")
          .doc(widget.custdocname)
          .collection("Programs")
          .doc(widget.docname)
          .update({'status': 'assigned'});

      fb
          .collection("Programs")
          .doc(widget.docname)
          .collection("AssignedPgm")
          .doc("Technician")
          .set(apgm.toMap())
          .then((value) {
        print("Updated as assigned in program");
        setState(() {
          _up = true;
        });
      }).catchError((error) =>
              print("Failed to update program in program field : $error"));

      fb
          .collection("Technician")
          .doc(widget.username)
          .collection("Assignedpgm")
          .doc(widget.docname)
          .set(apgm.toMap())
          .then((value) {
        fb.collection("history").doc(formattedDate).set(history.toMap());

        // customer program history updated
        fb
            .collection("Customer")
            .doc(widget.custdocname)
            .collection("Programs")
            .doc(widget.docname)
            .collection("History")
            .doc(formattedDate)
            .set(custhistory.toMap());

        setState(() {
          loading = false;
        });
      }).catchError((error) => print("Failed to assign program : $error"));
    }
  }
}
