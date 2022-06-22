import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:test2/constants/constants.dart';
import 'package:test2/services/customer.dart';

// ignore: must_be_immutable
class CustomerProfilesrc extends StatefulWidget {
  final cust;
  String? docname;
  CustomerProfilesrc({Key? key, this.docname, this.cust}) : super(key: key);

  @override
  StatussrcState createState() => StatussrcState();
}

class StatussrcState extends State<CustomerProfilesrc> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  Customer C_profile = Customer();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 60.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(5)),
              color: white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                  color: secondbg.withOpacity(0.20),
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bluebg),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Center(
                    child: Image(
                      image: AssetImage("assets/icons/imaicon.png"),
                      height: 45,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            blurRadius: 20,
                            color: secondbg.withOpacity(0.20),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          color: Colors.black.withOpacity(0.09),
                                          offset: const Offset(-2, 2),
                                        )
                                      ]),
                                  child: const CircleAvatar(
                                    backgroundColor: bluebg,
                                    backgroundImage: AssetImage(
                                        "assets/images/customer_icon.jpg"),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                "${widget.cust.name}",
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Customer Details",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 17.0),
                              child: Container(
                                width: 145,
                                height: 2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Address : ",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            color: Colors.black38),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Text(
                                          "${widget.cust.address}",
                                          style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Location : ",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            color: Colors.black38),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Text(
                                          "${widget.cust.loc}",
                                          style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Phone Number : ",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            color: Colors.black38),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Text(
                                          "${widget.cust.phn1}",
                                          style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    child: widget.cust.phn2.isNotEmpty
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Phone Number II  : ",
                                                style: TextStyle(
                                                    fontFamily: "Montserrat",
                                                    fontSize: 15,
                                                    color: Colors.black38),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Text(
                                                  "${widget.cust.phn2}",
                                                  style: const TextStyle(
                                                    fontFamily: "Montserrat",
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : null,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              spreadRadius: 3,
                                              blurRadius: 5,
                                              color: black.withOpacity(0.1),
                                              offset: const Offset(0, 3),
                                            )
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width: s.height * 0.1,
                                              height: s.height * 0.1,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color:
                                                      const Color(0xffEAF0FF)),
                                              child: const Icon(
                                                Icons
                                                    .production_quantity_limits_rounded,
                                                color: Color(0xff306FFF),
                                              )),
                                          Flexible(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                "${widget.cust.prospec}",
                                                style: const TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "Installation Date",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                    "${widget.cust.instadate}",
                                    style: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text("${widget.cust.upDate}",style: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),),

                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text("${widget.cust.upTime}",style: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),),

                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            blurRadius: 20,
                            color: secondbg.withOpacity(0.20),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  customerdetails() async {
    try {
      await fb
          .collection('Customer')
          .doc("${widget.docname}")
          .get()
          .then((value) {
        setState(() {
          C_profile = Customer.fromMap(value.data());
        });
      });
    } catch (e) {
      print(e);
    }
  }
}
