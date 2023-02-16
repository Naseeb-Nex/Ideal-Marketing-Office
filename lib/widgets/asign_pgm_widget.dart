import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:test2/componets/assign_pgm_card.dart';
import 'package:test2/componets/assignvehiclecard.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Assignpgmwidget extends StatefulWidget {
  String? uid;
  String? username;
  String? techname;

  Assignpgmwidget({Key? key, this.uid, this.username, this.techname})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AssignpgmwidgetState createState() => _AssignpgmwidgetState();
}

class _AssignpgmwidgetState extends State<Assignpgmwidget> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  String textquery = '';
  List pgm = [];
  List _allpgm = [];

  List pendingpgm = [];
  List assignpgm = [];

  final controller = TextEditingController();

  final Stream<QuerySnapshot> programstream =
      FirebaseFirestore.instance.collection('Programs').snapshots();
  double animSize = 0;
  bool vButton = false;

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.black54);
    final style = controller.text.isEmpty ? styleHint : styleActive;

    // Size
    Size s = MediaQuery.of(context).size;
    // Tech vehicle docname
    DateTime now = DateTime.now();
    String techvdoc = DateFormat('MM d').format(now);

    return Column(
      children: [
        Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: s.width * 0.5,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primarybg,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 5,
                        color: secondbg.withOpacity(0.20),
                      ),
                    ],
                  ),
                  child: Container(
                    height: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        icon: Icon(Icons.search, color: style.color),
                        suffixIcon: controller.text.isNotEmpty
                            ? GestureDetector(
                                child: Icon(Icons.close, color: style.color),
                                onTap: () {
                                  controller.clear();
                                  searchpgm('');
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                              )
                            : null,
                        hintText: "Search here",
                        hintStyle: style,
                        border: InputBorder.none,
                      ),
                      style: style,
                      onChanged: searchpgm,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: InkWell(
                              onTap: () =>showDialog(
                    context: context,
                    builder: (context) => RemoveVehicleDialog(
                        techname: widget.techname, username: widget.username, name: widget.techname,)),
                              child: AnimatedContainer(
                                width: animSize,
                                height: animSize,
                                duration: const Duration(milliseconds: 1400),
                                curve: Curves.fastOutSlowIn,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: bluebg,
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        color: bluebg.withOpacity(0.25),
                                        offset: const Offset(0, 4),
                                      )
                                    ]),
                                child: const Icon(
                                  Iconsax.tag_cross,
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: InkWell(
                              onTap: () => showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                        insetPadding: EdgeInsets.symmetric(
                                            horizontal: s.width * 0.35),
                                        child: FutureBuilder<DocumentSnapshot>(
                                          future: fb
                                              .collection("Technician")
                                              .doc(widget.username)
                                              .collection("Vehicle")
                                              .doc(techvdoc)
                                              .get(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<DocumentSnapshot>
                                                  snapshot) {
                                            if (snapshot.hasError) {
                                              return const Text(
                                                  "Something went wrong");
                                            }

                                            if (snapshot.hasData &&
                                                !snapshot.data!.exists) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      color: white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          offset: const Offset(
                                                              2, 4),
                                                          blurRadius: 20,
                                                          color: secondbg
                                                              .withOpacity(
                                                                  0.23),
                                                        ),
                                                      ],
                                                    ),
                                                    clipBehavior: Clip.hardEdge,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: s
                                                                      .width *
                                                                  0.02,
                                                              vertical:
                                                                  s.width *
                                                                      0.02),
                                                      child: Column(
                                                        children: [
                                                          Image.asset(
                                                              "assets/icons/no_vehicle.png",
                                                              width: s.height *
                                                                  0.33,
                                                              height: s.height *
                                                                  0.33),
                                                           Text(
                                                            "No Vehicle Assigned",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .blueGrey.shade700,),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }

                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              Map<String, dynamic> data =
                                                  snapshot.data!.data()
                                                      as Map<String, dynamic>;
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: s.height * 0.03,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                      "Vehicle Status",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        // color:
                                                        //     Color(0XFF767777),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: 20,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.blueGrey
                                                              .shade400),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Container(
                                                      height: s.height * 0.31,
                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: redbg,
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/delivery.gif',
                                                        width: s.height * 0.33,
                                                        height: s.height * 0.33,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Stack(
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            "${data["name"]}",
                                                            style:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    "${data["upTime"]}",
                                                                    style:
                                                                        const TextStyle(
                                                                      fontFamily:
                                                                          "Montserrt",
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Color(
                                                                          0XFF767777),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "${data["upDate"]}",
                                                                    style:
                                                                        const TextStyle(
                                                                      fontFamily:
                                                                          "Montserrt",
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Color(
                                                                          0XFF767777),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }

                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    color: white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        offset:
                                                            const Offset(0, 10),
                                                        blurRadius: 20,
                                                        color: secondbg
                                                            .withOpacity(0.23),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                s.width * 0.1),
                                                    child: Center(
                                                      child: SizedBox(
                                                        width: s.height * 0.15,
                                                        height: s.height * 0.15,
                                                        child:
                                                            const LoadingIndicator(
                                                          indicatorType: Indicator
                                                              .ballClipRotateMultiple,
                                                          colors: [bluebg],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      )),
                              child: AnimatedContainer(
                                width: animSize,
                                height: animSize,
                                duration: const Duration(milliseconds: 1200),
                                curve: Curves.fastOutSlowIn,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: bluebg,
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        color: bluebg.withOpacity(0.25),
                                        offset: const Offset(0, 4),
                                      )
                                    ]),
                                child: const Icon(
                                  Icons.directions_bike_rounded,
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: InkWell(
                              onTap: () => {
                                showDialog(
                                  context: context,
                                  builder: (context) => AddvehicleDialog(
                                    techname: widget.techname,
                                    username: widget.username,
                                  ),
                                )
                              },
                              child: AnimatedContainer(
                                width: animSize,
                                height: animSize,
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.fastOutSlowIn,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: bluebg,
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        color: bluebg.withOpacity(0.25),
                                        offset: const Offset(0, 4),
                                      )
                                    ]),
                                child: const Icon(
                                  Iconsax.add,
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            vButton = !vButton;
                          });
                          if (animSize == 35) {
                            setState(() {
                              animSize = 0;
                            });
                          } else {
                            setState(() {
                              animSize = 35;
                            });
                          }
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: vButton ? white : bluebg,
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  color: bluebg.withOpacity(0.25),
                                  offset: const Offset(0, 4),
                                )
                              ]),
                          child: vButton
                              ? const Center(
                                  child: Text(
                                    "X",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: bluebg,
                                    ),
                                  ),
                                )
                              : const Icon(
                                  Icons.directions_bike_rounded,
                                  color: white,
                                ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ScrollConfiguration(
              behavior: VerticalScrollgesture(),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: StreamBuilder<QuerySnapshot>(
                    stream: programstream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print('Something went Wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          width: double.infinity,
                          color: white,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: cheryred,
                            ),
                          ),
                        );
                      }
                      _allpgm.clear();
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map a = document.data() as Map<String, dynamic>;
                        _allpgm.add(a);
                        a['uid'] = document.id;
                      }).toList();

                      //filtering pending programs
                      assignpgm = _allpgm
                          .where((i) => i['status'] == 'pending')
                          .toList();

                      if (controller.text.isEmpty) {
                        pendingpgm = assignpgm;
                      }

                      return Column(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          for (var i = 0; i < pendingpgm.length; i++) ...[
                            Assignpgmcard(
                              uid: pendingpgm[i]["uid"],
                              name: pendingpgm[i]["name"],
                              address: pendingpgm[i]["address"],
                              loc: pendingpgm[i]["loc"],
                              pgm: pendingpgm[i]["pgm"],
                              chrg: pendingpgm[i]["chrg"],
                              phn: pendingpgm[i]["phn"],
                              type: pendingpgm[i]["type"],
                              upDate: pendingpgm[i]["upDate"],
                              upTime: pendingpgm[i]["upTime"],
                              docname: pendingpgm[i]["docname"],
                              prospec: pendingpgm[i]["prospec"],
                              instadate: pendingpgm[i]["instadate"],
                              custdocname: pendingpgm[i]["custdocname"],
                              techuid: widget.uid,
                              techname: widget.techname,
                              username: widget.username,
                            )
                          ]
                        ],
                      );
                    }),
              ),
            ),
          ),
        )
      ],
    );
  }

  void searchpgm(String query) {
    setState(() {
      pendingpgm = assignpgm.where((pgm) {
        final nameLower = pgm["name"]!.toLowerCase();
        final addressLower = pgm["address"]!.toLowerCase();
        final locLower = pgm["loc"]!.toLowerCase();

        final phnumber = pgm["phn"]!;
        final searchquery = query.toLowerCase();

        return nameLower.contains(searchquery) ||
            addressLower.contains(searchquery) ||
            locLower.contains(searchquery) ||
            phnumber.contains(searchquery);
      }).toList();
    });
    // searching is postponed
  }
}

class VerticalScrollgesture extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

// ignore: must_be_immutable
class AddvehicleDialog extends StatefulWidget {
  String? techname;
  String? username;

  AddvehicleDialog({Key? key, this.techname, this.username}) : super(key: key);

  @override
  State<AddvehicleDialog> createState() => _AddvehicleDialogState();
}

class _AddvehicleDialogState extends State<AddvehicleDialog> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    // Tech vehicle docname
    DateTime now = DateTime.now();
    String techvdoc = DateFormat('MM d').format(now);
    return Dialog(
      insetAnimationCurve: Curves.easeInCubic,
      insetAnimationDuration: const Duration(milliseconds: 500),
      insetPadding: EdgeInsets.symmetric(horizontal: s.width * 0.2),
      child: Padding(
        padding: EdgeInsets.all(
          s.width * 0.03,
        ),
        child: SizedBox(
          height: s.height * 0.8,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Assign Vehicle",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  color: black.withOpacity(0.15),
                                  offset: const Offset(0, 5))
                            ]),
                        child: Center(
                          child: Text(
                            "X",
                            style: TextStyle(
                                fontFamily: "Montserrt",
                                fontSize: 18,
                                color: Colors.blueGrey.withOpacity(0.5),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                const Divider(
                  thickness: 2,
                ),
                FutureBuilder<DocumentSnapshot>(
                  future: fb
                      .collection("Technician")
                      .doc(widget.username)
                      .collection("Vehicle")
                      .doc(techvdoc)
                      .get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Something went wrong");
                    }

                    if (snapshot.hasData && !snapshot.data!.exists) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: StreamBuilder<QuerySnapshot>(
                                stream: fb.collection("Garage").snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError) {}
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: SizedBox(
                                        width: s.width * 0.095,
                                        height: s.width * 0.095,
                                        child: const LoadingIndicator(
                                          indicatorType:
                                              Indicator.ballClipRotateMultiple,
                                          colors: [bluebg],
                                        ),
                                      ),
                                    );
                                  }

                                  final List vehicle = [];
                                  snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                    Map a =
                                        document.data() as Map<String, dynamic>;
                                    vehicle.add(a);
                                  }).toList();

                                  List avaliableVehicles = vehicle
                                      .where((i) => i['status'] == 'Available')
                                      .toList();
                                  return Column(
                                    children: [
                                      Container(
                                          child: avaliableVehicles.isEmpty
                                              ? Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          s.width * 0.01),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                          "assets/icons/not_asigned.jpg"),
                                                      const Text(
                                                        "No Vehicle Available",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontSize: 15,
                                                            color: Colors
                                                                .blueGrey),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : null),
                                      for (var i = 0;
                                          i < avaliableVehicles.length;
                                          i++) ...[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Assignvehiclecard(
                                            name: avaliableVehicles[i]['name'],
                                            desc: avaliableVehicles[i]
                                                ['description'],
                                            type: avaliableVehicles[i]['type'],
                                            status: avaliableVehicles[i]
                                                ['status'],
                                            docname: avaliableVehicles[i]
                                                ['docname'],
                                            techname: widget.techname,
                                            username: widget.username,
                                            statusdesc: avaliableVehicles[i]
                                                ['statusdesc'],
                                            update: avaliableVehicles[i]
                                                ['update'],
                                            uptime: avaliableVehicles[i]
                                                ['uptime'],
                                          ),
                                        )
                                      ]
                                    ],
                                  );
                                }),
                          ),
                        ],
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/warning.png",
                            fit: BoxFit.fitHeight,
                            width: s.width * 0.3,
                            height: s.width * 0.3,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: s.height * 0.02),
                            child: Text(
                              "${data["name"]} Already assigned to ${widget.techname}",
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${data["upTime"]}",
                                    style: const TextStyle(
                                      fontFamily: "Montserrt",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    "${data["upDate"]}",
                                    style: const TextStyle(
                                      fontFamily: "Montserrt",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      );
                    }

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 10),
                                blurRadius: 20,
                                color: secondbg.withOpacity(0.23),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: s.width * 0.1),
                            child: Center(
                              child: SizedBox(
                                width: s.width * 0.15,
                                height: s.width * 0.15,
                                child: const LoadingIndicator(
                                  indicatorType:
                                      Indicator.ballClipRotateMultiple,
                                  colors: [bluebg],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// ignore: must_be_immutable
class RemoveVehicleDialog extends StatefulWidget {
  String? techname;
  String? username;
  String? name;

  RemoveVehicleDialog({Key? key, this.techname, this.username, this.name}) : super(key: key);

  @override
  State<RemoveVehicleDialog> createState() => _RemoveVehicleDialogState();
}

class _RemoveVehicleDialogState extends State<RemoveVehicleDialog> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    String techvdoc = DateFormat('MM d').format(now);
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
                                            horizontal: s.width * 0.25),
      child: FutureBuilder<DocumentSnapshot>(
        future: fb
            .collection("Technician")
            .doc(widget.username)
            .collection("Vehicle")
            .doc(techvdoc)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return  const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      color: white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          offset: const Offset(
                                                              2, 4),
                                                          blurRadius: 20,
                                                          color: secondbg
                                                              .withOpacity(
                                                                  0.23),
                                                        ),
                                                      ],
                                                    ),
                                                    clipBehavior: Clip.hardEdge,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: s
                                                                      .width *
                                                                  0.02,
                                                              vertical:
                                                                  s.width *
                                                                      0.02),
                                                      child: Column(
                                                        children: [
                                                          Image.asset(
                                                              "assets/icons/no_vehicle.png",
                                                              width: s.height *
                                                                  0.33,
                                                              height: s.height *
                                                                  0.33),
                                                           Text(
                                                            "No Assigned Vehicle To Impound",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .blueGrey.shade700,),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Padding(
                    padding: EdgeInsets.all(s.height * 0.01),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Center(
                              child: Image.asset(
                                "assets/images/delivery.jpg",
                                width: s.height * 0.2,
                                height: s.height * 0.2,
                              ),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Do you really want to Impound ',
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 15,
                                color: Color(0XFF676767),
                                fontWeight: FontWeight.w400,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${data["name"]}',
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0XFF676767),
                                  ),
                                ),
                                const TextSpan(
                                  text: ' from ',
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    color: Color(0XFF676767),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: '${widget.techname} ?',
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0XFF676767),
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: s.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                width: s.width * 0.1,
                                height: s.height * 0.05,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0XFFE7E7E7),
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                  color: white,
                                ),
                                child: const Center(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0XFF323233),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => removeV(context, data["vdocname"],data["type"], data["name"] ),
                              child: Container(
                                width: s.width * 0.1,
                                height: s.height * 0.05,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0XFFE7E7E7),
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                  color: cheryred.withOpacity(0.1),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Okay",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0XFF323233),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: s.height * 0.03,
                        ),
                      ],
                    ),
                  );
           
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 20,
                      color: secondbg.withOpacity(0.23),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: s.width * 0.1),
                  child: Center(
                    child: SizedBox(
                      width: s.width * 0.15,
                      height: s.width * 0.15,
                      child:  const LoadingIndicator(
                        indicatorType: Indicator.ballClipRotateMultiple,
                        colors:[bluebg],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> removeV(BuildContext context, String? docname, String? type, String? name) async {
    // DateTime now = DateTime.now();
    // String techvdoc = DateFormat('MM d').format(now);
    // String usagedocname = DateFormat('MM d y kk:mm:ss').format(now);

    // // Vehicle usage history
    // String update = DateFormat('d MM y').format(now);
    // String uptime = DateFormat('h:mma').format(now);

    // // Vehicle history class is added
    // VehicleUsageHistory vusage = VehicleUsageHistory(
    //   name: name,
    //   upDate: update,
    //   upTime: uptime,
    //   username: widget.username,
    //   docname: usagedocname,
    //   techname: widget.techname,
    //   type: type,
    //   status: "Impounded"
    // );
    
    // showDialog(context: context, builder: ((context) => LoadingDialog()));
    // await fb
    //     .collection("Technician")
    //     .doc(widget.username)
    //     .collection("Vehicle")
    //     .doc(techvdoc)
    //     .delete()
    //     .then((value) => (print("data deleted suscessfully")));

    // // status change
    // await fb.collection("Garage").doc(docname).set(
    //     {"status": "Available", "techname": "none", "username": "none"},
    //     SetOptions(merge: true));

    // // history added
    // await fb
    //     .collection("GarageUsage")
    //     .doc(usagedocname)
    //     .set(vusage.toMap())
    //     .then((v) => print("Vehicle assigned history added"));

    // Navigator.of(context).pop();
    // Navigator.pop(context);
    // MotionToast.success(
    //   title: Text(
    //     "Vehicle impounded from ${widget.techname}",
    //     style: TextStyle(
    //       fontFamily: "Montserrat",
    //       fontSize: 16,
    //       fontWeight: FontWeight.w500,
    //     ),
    //   ),
    //   description: Text(
    //     "Successfully vehicle Impounded",
    //     style: TextStyle(
    //       fontFamily: "Montserrat",
    //       fontSize: 12,
    //       fontWeight: FontWeight.w300,
    //     ),
    //   ),
    // ).show(context);
  }
}
