import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/services/assignedpgmdata.dart';
import 'package:intl/intl.dart';

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
  }) : super(key: key);

  @override
  _AssignpgmcardState createState() => _AssignpgmcardState();
}

class _AssignpgmcardState extends State<Assignpgmcard> {
  final controller = TextEditingController();
  final _priorityKey = GlobalKey<FormState>();
  bool _up = false;
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Container(
        height: 180,
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
                        "${widget.name}",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "${widget.address}",
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
                      "${widget.pgm}",
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
                        "${widget.upDate}",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "${widget.upTime}",
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
                          "  ${widget.loc}",
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
                          "Type : ${widget.type}",
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
                          "  ${widget.phn}",
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
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                    child: Row(
                      children: [
                        Container(
                          child: const Text(
                            "Set Priority :   ",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF008080),
                            ),
                          ),
                        ),
                        Container(
                          width: 35,
                          alignment: Alignment.center,
                          child: Form(
                            key: _priorityKey,
                            child: TextFormField(
                              autofocus: false,
                              controller: controller,
                              onSaved: (value) {
                                controller.text = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  error = true;
                                  return null;
                                }
                                error = false;
                                return null;
                              },
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => uploadpgmdata(),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: _up == true
                                  ? Colors.greenAccent
                                  : Colors.redAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.done,
                              color: white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void uploadpgmdata() async{
    FirebaseFirestore fb = await FirebaseFirestore.instance;
    DateTime now = DateTime.now();
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
          status: "pending",
          username: widget.username,
          techname: widget.techname,
          priority: controller.text,
          assigneddate: assigneddate,
          assignedtime: assignedtime);

    if (_priorityKey.currentState!.validate()) {
      fb.collection("Programs")
      .doc(widget.docname)
      .update({'status': 'assigned'})
      .then((value) => print("Updated as assigned"))
    .catchError((error) => print("Failed to update program : $error"));

      fb.collection("Programs")
      .doc(widget.docname)
      .collection("AssignedPgm")
      .doc("Technician")
      .set(apgm.toMap())
      .then((value){ print("Updated as assigned in program");
      })
    .catchError((error) => print("Failed to update program in program field : $error"));

    fb.collection("Technician")
      .doc(widget.username)
      .collection("Assignedpgm")
      .doc(widget.docname)
      .set(apgm.toMap())
      .then((value) {print("assigned pgm to technicain");
      setState(() {
        _up = true;
      });})
    .catchError((error) => print("Failed to assign program : $error"));
    }
  }
}
