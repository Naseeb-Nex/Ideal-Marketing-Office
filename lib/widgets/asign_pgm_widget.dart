import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:test2/componets/assign_pgm_card.dart';
import 'package:test2/componets/assignvehiclecard.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Assignpgmwidget extends StatefulWidget {
  String? uid;
  String? username;
  String? techname;

  Assignpgmwidget({Key? key, this.uid, this.username, this.techname})
      : super(key: key);

  @override
  _AssignpgmwidgetState createState() => _AssignpgmwidgetState();
}

class _AssignpgmwidgetState extends State<Assignpgmwidget> {
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
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
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
                                                      horizontal: s.width * 0.01),
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
                                                            color:
                                                                Colors.blueGrey),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : null),
                                      for (var i = 0;
                                          i < avaliableVehicles.length;
                                          i++) ...[
                                        Padding(
                                          padding:
                                             const EdgeInsets.symmetric(vertical: 5.0),
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
                            padding: EdgeInsets.symmetric(vertical: s.width * 0.1),
                            child: Center(
                              child: SizedBox(
                                width: s.width * 0.15,
                                height: s.width * 0.15,
                                child: const LoadingIndicator(
                                  indicatorType: Indicator.ballClipRotateMultiple,
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
