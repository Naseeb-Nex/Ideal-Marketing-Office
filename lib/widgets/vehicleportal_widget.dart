import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:test2/componets/vehicleinfocard.dart';
import 'package:test2/componets/vusagehistorycard.dart';
import 'package:test2/constants/constants.dart';

// firebase firestore
import 'package:cloud_firestore/cloud_firestore.dart';
// iconsax
import 'package:iconsax/iconsax.dart';
// loading_indicator
import 'package:loading_indicator/loading_indicator.dart';

// ignore: must_be_immutable
class VehiclePortalWidget extends StatefulWidget {
  String? username;
  String? techname;

  VehiclePortalWidget({Key? key, this.username, this.techname})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VehiclePortalWidgetState createState() => _VehiclePortalWidgetState();
}

class _VehiclePortalWidgetState extends State<VehiclePortalWidget> {
  FirebaseFirestore fb = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ScrollConfiguration(
              behavior: VerticalScrollgesture(),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.only(top: s.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Vehicle Portal",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            color: Color(0XFF333333)),
                      ),
                      const SizedBox(height: 3,),
                       Text(
                        "Its a Grage! for managing vehicles",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey.shade500,),
                      ),
                      const Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.all(s.width * 0.01),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    color: black.withOpacity(.05),
                                    offset: const Offset(1, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          "Vehicle Garage",
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Icon(Iconsax.more, color: black),
                                      ],
                                    ),
                                    const Divider(
                                      color: Color(0XFFadb5bd),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    StreamBuilder<QuerySnapshot>(
                                        stream:
                                            fb.collection("Garage").snapshots(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<QuerySnapshot>
                                                snapshot) {
                                          if (snapshot.hasError) {}
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Center(
                                              child: SizedBox(
                                                width: s.width * 0.1,
                                                height: s.width * 0.1,
                                                child: const LoadingIndicator(
                                                  indicatorType: Indicator
                                                      .ballClipRotateMultiple,
                                                  colors: [bluebg],
                                                ),
                                              ),
                                            );
                                          }

                                          final List vehicle = [];
                                          snapshot.data!.docs
                                              .map((DocumentSnapshot document) {
                                            Map a = document.data()
                                                as Map<String, dynamic>;
                                            vehicle.add(a);
                                            // a['uid'] = document.id;
                                          }).toList();
                                          return Column(
                                            children: [
                                              Container(
                                                  child: vehicle.isEmpty
                                                      ? Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      s.width *
                                                                          0.01),
                                                          child: Image.asset(
                                                              "assets/icons/no_vehicles.jpg"),
                                                        )
                                                      : null),
                                              for (var i = 0;
                                                  i < vehicle.length;
                                                  i++) ...[
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5.0),
                                                  child: VechicleInfoCard(
                                                    name: vehicle[i]['name'],
                                                    desc: vehicle[i]
                                                        ['description'],
                                                    type: vehicle[i]['type'],
                                                    status: vehicle[i]
                                                        ['status'],
                                                    techname: vehicle[i]
                                                        ['techname'],
                                                    username: vehicle[i]
                                                        ['username'],
                                                    vdocname: vehicle[i]
                                                        ['docname'],
                                                    statusdesc: vehicle[i]
                                                        ['statusdesc'],
                                                    update: vehicle[i]
                                                        ['update'],
                                                    uptime: vehicle[i]
                                                        ['uptime'],
                                                  ),
                                                )
                                              ]
                                            ],
                                          );
                                        }),
                                  ]),
                            ),
                          ),
                          Flexible(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  padding: EdgeInsets.all(s.width * 0.02),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        color: black.withOpacity(.05),
                                        offset: const Offset(1, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Recent Activity",
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: Color(0XFFadb5bd),
                                      ),
                                      StreamBuilder<QuerySnapshot>(
                              stream: fb
                                  .collection("GarageUsage")
                                  .orderBy('docname', descending: true)
                                  .limit(8)
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {}
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: SizedBox(
                                      width: s.width * 0.1,
                                      height: s.width * 0.1,
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
                                  // a['uid'] = document.id;
                                }).toList();
                                return Column(
                                  children: [
                                    Container(
                                        child: vehicle.isEmpty
                                            ? Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: s.width * 0.005),
                                                child: Image.asset(
                                                    "assets/icons/no_result.png"),
                                              )
                                            : null),
                                    for (var i = 0;
                                        i < vehicle.length;
                                        i++) ...[
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        child: Vusagehistorycard(
                                          name: vehicle[i]['name'],
                                          desc: vehicle[i]['description'],
                                          type: vehicle[i]['type'],
                                          status: vehicle[i]['status'],
                                          techname: vehicle[i]['techname'],
                                          username: vehicle[i]['username'],
                                          docname: vehicle[i]['docname'],
                                          upDate: vehicle[i]['upDate'],
                                          upTime: vehicle[i]['upTime'],
                                          start: vehicle[i]['start'],
                                          end: vehicle[i]['end'],
                                        ),
                                      )
                                    ]
                                  ],
                                );
                              }),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
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
