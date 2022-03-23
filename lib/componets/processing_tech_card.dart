import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:test2/services/pgm.dart';

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
  String? pdate;
  String? pdocname;

  Protechcard({
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
    this.pdocname,
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
                            );
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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

  ConfirmBox({
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
  });

  final TextEditingController pgmController = new TextEditingController();
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
                children: [
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
            SizedBox(
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
                  Text(
                    "Program : ",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black26,
                    ),
                  ),
                  Container(
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
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
                    child: Center(
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
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  child: Container(
                    height: 60,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.greenAccent),
                    child: Center(
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
          status: "pending");
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

      await fb
          .collection("Programs")
          .doc("$docname")
          .set(pgmr.toMap())
          .then((value) {
        print("Successfully Program created");
        Navigator.pop(context);
      });
    }
  }
}
