import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test2/componets/homealertbox.dart';

import 'package:test2/constants/constants.dart';
import 'package:test2/services/customer.dart';
import 'package:test2/widgets/customer_history_widget.dart';
import 'package:test2/widgets/customer_pgm_registration.dart';

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
  final formkey = GlobalKey<FormState>();
  Customer C_profile = Customer();
  String current_scr = "programs";
  bool editmode = false;
  bool loading = false;
  // String current_scr = "reg";

  TextEditingController namecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController loccontroller = TextEditingController();
  TextEditingController prospeccontroller = TextEditingController();
  TextEditingController instadatecontroller = TextEditingController();
  TextEditingController phn1controller = TextEditingController();
  TextEditingController phn2controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        namecontroller.text = widget.cust.name;
        addresscontroller.text = widget.cust.address;
        loccontroller.text = widget.cust.loc;
        prospeccontroller.text = widget.cust.prospec;
        instadatecontroller.text = widget.cust.instadate;
        phn1controller.text = widget.cust.phn1;
        phn2controller.text = widget.cust.phn2;
      });
    }
  }

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
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
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () => setState(() {
                      current_scr = "reg";
                    }),
                    child: Container(
                      width: 50,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 3,
                            color: black.withOpacity(0.1),
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.add,
                        color: bluebg,
                      ),
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
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: s.height - 80,
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
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(80),
                                        boxShadow: [
                                          BoxShadow(
                                            spreadRadius: 3,
                                            blurRadius: 5,
                                            color:
                                                Colors.black.withOpacity(0.09),
                                            offset: const Offset(-2, 2),
                                          )
                                        ]),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      clipBehavior: Clip.none,
                                      children: [
                                        const CircleAvatar(
                                          backgroundColor: bluebg,
                                          backgroundImage: AssetImage(
                                              "assets/images/customer_icon.jpg"),
                                        ),
                                        Positioned(
                                          right: 3,
                                          bottom: 0,
                                          child: InkWell(
                                            onTap: () => setState(() {
                                              editmode = !editmode;
                                            }),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: editmode
                                                      ? cheryred
                                                      : const Color(0XFFffcc00),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        spreadRadius: 3,
                                                        blurRadius: 4,
                                                        color: black
                                                            .withOpacity(0.2),
                                                        offset:
                                                            const Offset(-2, 0))
                                                  ]),
                                              height: 35,
                                              width: 35,
                                              child: Center(
                                                child: editmode
                                                    ? const Icon(
                                                        Icons.cancel,
                                                        color: white,
                                                      )
                                                    : const Icon(
                                                        Icons.edit_outlined,
                                                        color: yellowbg,
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: editmode
                                    ? Form(
                                        key: formkey,
                                        child: Stack(
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(
                                                    height: s.height * 0.3),
                                                Center(
                                                    child: loading
                                                        ? const CircularProgressIndicator(
                                                            color: yellowfg,
                                                          )
                                                        : null),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: TextFormField(
                                                      autofocus: false,
                                                      controller:
                                                          namecontroller,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      onSaved: (value) {
                                                        namecontroller.text =
                                                            value!;
                                                      },
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return ("Please enter the Name");
                                                        }
                                                        return null;
                                                      },
                                                      decoration: InputDecoration(
                                                          isDense: true,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 8,
                                                                  vertical: 15),
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10))),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 30,
                                                ),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "Customer Details",
                                                    style: TextStyle(
                                                      fontFamily: "Montserrat",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            "Address : ",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black38),
                                                          ),
                                                          Flexible(
                                                            flex: 1,
                                                            child:
                                                                TextFormField(
                                                              autofocus: false,
                                                              controller:
                                                                  addresscontroller,
                                                              onSaved: (value) {
                                                                addresscontroller
                                                                        .text =
                                                                    value!;
                                                              },
                                                              validator:
                                                                  (value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return ("Please enter the Address");
                                                                }
                                                                return null;
                                                              },
                                                              decoration: InputDecoration(
                                                                  isDense: true,
                                                                  contentPadding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          8,
                                                                      vertical:
                                                                          10),
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8))),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 15),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            "Location : ",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black38),
                                                          ),
                                                          Flexible(
                                                            flex: 1,
                                                            child:
                                                                TextFormField(
                                                              autofocus: false,
                                                              controller:
                                                                  loccontroller,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              onSaved: (value) {
                                                                loccontroller
                                                                        .text =
                                                                    value!;
                                                              },
                                                              validator:
                                                                  (value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return ("Please enter the Location");
                                                                }
                                                                return null;
                                                              },
                                                              decoration: InputDecoration(
                                                                  isDense: true,
                                                                  contentPadding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          8,
                                                                      vertical:
                                                                          10),
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10))),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 15),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            "Phone Number : ",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black38),
                                                          ),
                                                          Flexible(
                                                            flex: 1,
                                                            child:
                                                                TextFormField(
                                                              autofocus: false,
                                                              controller:
                                                                  phn1controller,
                                                              onSaved: (value) {
                                                                phn1controller
                                                                        .text =
                                                                    value!;
                                                              },
                                                              validator:
                                                                  (value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return ("Phone Number feild can't be empty");
                                                                } else if (value
                                                                        .length !=
                                                                    10) {
                                                                  return ("invalid Phone Number");
                                                                }
                                                                return null;
                                                              },
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            10),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 15),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            "Phone Number II  : ",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black38),
                                                          ),
                                                          Flexible(
                                                            flex: 1,
                                                            child:
                                                                TextFormField(
                                                              autofocus: false,
                                                              controller:
                                                                  phn2controller,
                                                              onSaved: (value) {
                                                                phn2controller
                                                                        .text =
                                                                    value!;
                                                              },
                                                              decoration: InputDecoration(
                                                                  isDense: true,
                                                                  contentPadding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          8,
                                                                      vertical:
                                                                          10),
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8))),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 30,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  spreadRadius:
                                                                      3,
                                                                  blurRadius: 5,
                                                                  color: black
                                                                      .withOpacity(
                                                                          0.1),
                                                                  offset:
                                                                      const Offset(
                                                                          0, 3),
                                                                )
                                                              ]),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                  width:
                                                                      s.height *
                                                                          0.1,
                                                                  height:
                                                                      s.height *
                                                                          0.1,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: const Color(
                                                                          0xffEAF0FF)),
                                                                  child:
                                                                      const Icon(
                                                                    Icons
                                                                        .production_quantity_limits_rounded,
                                                                    color: Color(
                                                                        0xff306FFF),
                                                                  )),
                                                              Flexible(
                                                                flex: 1,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(10),
                                                                  child:
                                                                      TextFormField(
                                                                    autofocus:
                                                                        false,
                                                                    controller:
                                                                        prospeccontroller,
                                                                    onSaved:
                                                                        (value) {
                                                                      prospeccontroller
                                                                              .text =
                                                                          value!;
                                                                    },
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return ("Please enter the Product Specification");
                                                                      }
                                                                      return null;
                                                                    },
                                                                    minLines: 2,
                                                                    maxLines: 3,
                                                                    decoration: InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        contentPadding: const EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                8,
                                                                            vertical:
                                                                                10),
                                                                        border: OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10))),
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
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black38),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        width: s.width * 0.1,
                                                        child: TextFormField(
                                                          autofocus: false,
                                                          controller:
                                                              instadatecontroller,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          onSaved: (value) {
                                                            instadatecontroller
                                                                .text = value!;
                                                          },
                                                          validator: (value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return ("Please enter the Installation Date");
                                                            }
                                                            return null;
                                                          },
                                                          decoration: InputDecoration(
                                                              isDense: true,
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          8,
                                                                      vertical:
                                                                          10),
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8))),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      InkWell(
                                                        onTap: () =>
                                                            updateprofile(),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 10),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              color: greenbg),
                                                          child: const Text(
                                                            "Update Profile",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .green),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Text(
                                                          "${widget.cust.upDate}",
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                "Nunito",
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black54,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Text(
                                                          "${widget.cust.upTime}",
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                "Nunito",
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black54,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    : Column(
                                        children: [
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
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Address : ",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black38),
                                                    ),
                                                    Flexible(
                                                      flex: 1,
                                                      child: Text(
                                                        "${widget.cust.address}",
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 15),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Location : ",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black38),
                                                    ),
                                                    Flexible(
                                                      flex: 1,
                                                      child: Text(
                                                        "${widget.cust.loc}",
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 15),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Phone Number : ",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontSize: 15,
                                                          color:
                                                              Colors.black38),
                                                    ),
                                                    Flexible(
                                                      flex: 1,
                                                      child: Text(
                                                        "${widget.cust.phn1}",
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 15),
                                                Container(
                                                  child: widget
                                                          .cust.phn2.isNotEmpty
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                              "Phone Number II  : ",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Montserrat",
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black38),
                                                            ),
                                                            Flexible(
                                                              flex: 1,
                                                              child: Text(
                                                                "${widget.cust.phn2}",
                                                                style:
                                                                    const TextStyle(
                                                                  fontFamily:
                                                                      "Montserrat",
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
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Container(
                                                    width: double.infinity,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            spreadRadius: 3,
                                                            blurRadius: 5,
                                                            color: black
                                                                .withOpacity(
                                                                    0.1),
                                                            offset:
                                                                const Offset(
                                                                    0, 3),
                                                          )
                                                        ]),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                            width:
                                                                s.height * 0.1,
                                                            height:
                                                                s.height * 0.1,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color: const Color(
                                                                    0xffEAF0FF)),
                                                            child: const Icon(
                                                              Icons
                                                                  .production_quantity_limits_rounded,
                                                              color: Color(
                                                                  0xff306FFF),
                                                            )),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child: Text(
                                                              "${widget.cust.prospec}",
                                                              style:
                                                                  const TextStyle(
                                                                fontFamily:
                                                                    "Nunito",
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black38),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "${widget.cust.instadate}",
                                                  style: const TextStyle(
                                                    fontFamily: "Nunito",
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    "${widget.cust.upDate}",
                                                    style: const TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 12,
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    "${widget.cust.upTime}",
                                                    style: const TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 12,
                                                      color: Colors.black54,
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
                      height: s.height - 80,
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
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            width: s.width * 0.4,
                            decoration: BoxDecoration(
                                color: bluebg,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: InkWell(
                                    onTap: () => setState(() {
                                      current_scr = "programs";
                                    }),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            "Programs",
                                            style: TextStyle(
                                              color: current_scr == "programs"
                                                  ? white
                                                  : const Color(0xFFD9E9E9),
                                              fontFamily: "Montserrat",
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: current_scr == "programs"
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Container(
                                                    height: 5,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: white),
                                                  ),
                                                )
                                              : null,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: InkWell(
                                      onTap: () => setState(() {
                                        current_scr = "reg";
                                      }),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                              child: Text(
                                            "Registration",
                                            style: TextStyle(
                                                color: current_scr == "reg"
                                                    ? white
                                                    : const Color(0xFFD9E9E9),
                                                fontFamily: "Montserrat",
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          Container(
                                            child: current_scr == "reg"
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    child: Container(
                                                      height: 5,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: white),
                                                    ),
                                                  )
                                                : null,
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          CustomerViewWrappaer(
                            src: current_scr,
                            cust: widget.cust,
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

  void updateprofile() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    if (formkey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

      firebaseFirestore.collection("Customer").doc(widget.cust.docname).update({
        'name': namecontroller.text,
        'address': addresscontroller.text,
        'loc': loccontroller.text,
        'phn1': phn1controller.text,
        'phn2': phn2controller.text,
        'prospec': prospeccontroller.text,
        'instadate': instadatecontroller.text,
      }).then((value) {
        setState(() {
          loading = false;
          editmode = false;
        });
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const Homealertbox(
                  "Customer Profile Updated", bluebg, "Sucessfull");
            });
      }).catchError((eroor) {
        setState(() {
          loading = false;
          editmode = false;
        });
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const SimpleCustomAlert("Something went Wrong, Try again!",
                  Colors.redAccent, "Error");
            });
      });
    }
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

// ignore: must_be_immutable
class CustomerViewWrappaer extends StatelessWidget {
  String? src;
  final cust;
  CustomerViewWrappaer({Key? key, this.src, this.cust}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (src == 'programs') {
      return CustomerHistory(
        cust: cust,
      );
    }
    return CustomerpgmReg(
      cust: cust,
    );
  }
}
