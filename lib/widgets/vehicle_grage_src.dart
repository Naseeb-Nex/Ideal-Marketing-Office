import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:test2/componets/vehicleinfocard.dart';
import 'package:test2/constants/constants.dart';
import 'package:intl/intl.dart';

// firebase firestore
import 'package:cloud_firestore/cloud_firestore.dart';
// iconsax
import 'package:iconsax/iconsax.dart';
// loading_indicator
import 'package:loading_indicator/loading_indicator.dart';
import 'package:motion_toast/motion_toast.dart';

// ignore: must_be_immutable
class VehicleGrage extends StatefulWidget {
  String? username;
  String? techname;

  VehicleGrage({Key? key, this.username, this.techname}) : super(key: key);

  @override
  _VehicleGrageState createState() => _VehicleGrageState();
}

class _VehicleGrageState extends State<VehicleGrage> {
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
                  padding: EdgeInsets.only(top: s.height * 0.02 ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 5,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
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
                            const Divider(color: Color(0XFFadb5bd),),
                            const SizedBox(
                              height: 10,
                            ),
                            StreamBuilder<QuerySnapshot>(
                                stream: fb.collection("Garage").snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError) {}
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: SizedBox(
                                        width: s.width * 0.25,
                                        height: s.width * 0.25,
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
                                                      horizontal:
                                                          s.width * 0.01),
                                                  child: Image.asset(
                                                      "assets/icons/no_vehicles.jpg"),
                                                )
                                              : null),
                                      for (var i = 0;
                                          i < vehicle.length;
                                          i++) ...[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: VechicleInfoCard(
                                            name: vehicle[i]['name'],
                                            desc: vehicle[i]['description'],
                                            type: vehicle[i]['type'],
                                            status: vehicle[i]['status'],
                                            techname: vehicle[i]['techname'],
                                            username: vehicle[i]['username'],
                                            vdocname: vehicle[i]['docname'],
                                            statusdesc: vehicle[i]
                                                ['statusdesc'],
                                            update: vehicle[i]['update'],
                                            uptime: vehicle[i]['uptime'],
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start, 
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
                            const Divider(color: Color(0XFFadb5bd),),
                            
                                ],
                              ),
                            ),
                          )),
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
