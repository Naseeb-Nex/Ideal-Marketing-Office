import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/services/assignedpgmdata.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
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
                        SizedBox(
                          width: s.width * 0.12,
                          child: Text(
                            "${widget.name}",
                            style: const TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                            softWrap: true,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.add_business_rounded,
                              color: Color(0XFF9b5de5),
                              size: 20,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: s.width * 0.1,
                              child: Text(
                                "${widget.address}",
                                style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.left,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.pin_drop_outlined,
                              color: cheryred,
                              size: 20,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: s.width * 0.11,
                              child: Text(
                                "${widget.loc}",
                                style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: bluebg,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 8),
                          child: Text(
                            "${widget.type}",
                            style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 15,
                                color: white),
                          ),
                        ),
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
                            Row(
                              children: [
                                const Icon(
                                  Icons.production_quantity_limits_rounded,
                                  color: bluebg,
                                  size: 20,
                                ),
                                Text(
                                  "${widget.prospec}",
                                  style: const TextStyle(
                                      fontFamily: "Montserrat", fontSize: 13),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.date_range_rounded,
                                  color: Color(0XFFe56b6f),
                                  size: 20,
                                ),
                                Text(
                                  "${widget.instadate}",
                                  style: const TextStyle(
                                      fontFamily: "Montserrat", fontSize: 13),
                                ),
                              ],
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
    String assigneddate = DateFormat('d MM y').format(now);
    String assignedtime = DateFormat('h:mma').format(now);

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
      status: "assigned",
      username: widget.username,
      techname: widget.techname,
      priority: _controller.text,
      assigneddate: assigneddate,
      assignedtime: assignedtime,
      custdocname: widget.custdocname,
    );

    if (_priorityKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

      fb
          .collection("ConfirmList")
          .doc(widget.docname)
          .set(apgm.toMap())
          .then((value) {
        setState(() {
          _up = true;
          loading = false;
        });
      }).catchError((error) {});
    }
  }
}
