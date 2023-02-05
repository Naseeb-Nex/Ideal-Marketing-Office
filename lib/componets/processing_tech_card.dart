import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/services/customer_history.dart';

import 'package:test2/services/pgm.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Protechcard extends StatelessWidget {
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
  String? pdocname;
  String? custdocname;
  String? pdate;
  String? prospec;
  String? instadate;

  Protechcard(
      {Key? key,
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
      this.pdocname,
      this.custdocname,
      this.prospec,
      this.instadate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 5,
              color: secondbg.withOpacity(0.15),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                      "$name",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: s.width * 0.1,
                      child: Text(
                        "$address",
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    width: s.width * 0.5,
                  child: Center(
                    child: Text(
                      "$pgm",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "$upDate",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "$upTime",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.pin_drop_outlined,
                        color: cheryred,
                      ),
                      Text(
                        "  $loc",
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Type : $type",
                          style: const TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 15,
                            color: Color(0xFF0e2f44),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      const Icon(
                        Icons.phone_android,
                        color: Color(0xFF008080),
                      ),
                      Text(
                        "  $phn",
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF008080),
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
                              uid: uid,
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
                              pdocname: pdocname,
                              custdocname: custdocname,
                              prospec: prospec,
                              instadate: instadate,
                            );
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent),
                      child: const Center(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: Text(
                            "Set New Program",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
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
                    const SizedBox(width: 20),
                    const Text(
                      "Remarks : ",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "$remarks",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Completed Date : $ptime",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Completed Time :  $pdate",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14,
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

// ignore: must_be_immutable
class ConfirmBox extends StatelessWidget {
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
  String? pdocname;
  String? custdocname;
  String? prospec;
  String? instadate;

  ConfirmBox({
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
    this.pdocname,
    this.custdocname,
    this.prospec,
    this.instadate,
  }) : super(key: key);

  final TextEditingController pgmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: s.height * 0.5,
        width: s.width * 0.4,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                    child: Text(
                      "Processing Program",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
              const Center(
              child: Text(
                "Please enter the new Program of this Client",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Program : ",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black26,
                    ),
                  ),
                  SizedBox(
                    width: s.width * 0.20,
                    child: TextFormField(
                      autofocus: false,
                      controller: pgmController,
                      minLines: 1,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      onSaved: (value) {
                        pgmController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Program Feild Cannot be empty");
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 60,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () => coverttomain(context),
                  child: Container(
                    height: 60,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.greenAccent),
                    child: const Center(
                      child: Text(
                        "Okay",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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

  void coverttomain(BuildContext context) async {
    FirebaseFirestore fb = FirebaseFirestore.instance;
    DateTime now = DateTime.now();
    String hisdocname = DateFormat('MM d y kk:mm:ss').format(now);
    String date = DateFormat('d MMM y').format(now);
    String time = DateFormat('h:mma').format(now);

    if (_formKey.currentState!.validate()) {
      Pgmdata pgmr = Pgmdata(
          uid: uid,
          name: name,
          address: address,
          loc: loc,
          phn: phn,
          pgm: pgmController.text,
          chrg: chrg,
          type: type,
          upDate: upDate,
          upTime: upTime,
          docname: docname,
          custdocname: custdocname,
          instadate: instadate,
          prospec: prospec,
          status: "pending");

      CustomerPgmHistory custhistory = CustomerPgmHistory(
          upDate: date,
          upTime: time,
          msg: "Continue the program with new Process",
          status: "pending",
          docname: hisdocname,
          custdocname: custdocname);

      await fb
          .collection("Technician")
          .doc(username)
          .collection("Processingpgm")
          .doc(pdocname)
          .delete()
          .then((value) {
        print("Delete from pending list");
      }).catchError(
              (error) => print("Failed to Delete Pending pgm list : $error"));

      // Updating the Customer program status
      fb
          .collection("Customer")
          .doc(custdocname)
          .collection("Programs")
          .doc(docname)
          .set({'status': 'pending', 'newpgm': pgmController.text}, SetOptions(merge: true));

      // customer program history updated
      fb
          .collection("Customer")
          .doc(custdocname)
          .collection("Programs")
          .doc(docname)
          .collection("History")
          .doc(hisdocname)
          .set(custhistory.toMap());

      await fb
          .collection("Programs")
          .doc("$docname")
          .set(pgmr.toMap())
          .then((value) {
        Navigator.pop(context);
      });
    }
  }
}
