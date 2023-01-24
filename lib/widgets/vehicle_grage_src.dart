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

  VehicleGrage({Key? key, this.username, this.techname})
      : super(key: key);

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
                child: Column(
                    children: [
                      SizedBox(
                        height: s.height * 0.03,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: s.width * 0.03, vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 4,
                                color: secondbg.withOpacity(0.23),
                                offset: Offset(5, 7),
                              ),
                            ]),
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                "Vehicle Garage",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: bluebg,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          SizedBox(
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
                                      child: LoadingIndicator(
                                        indicatorType:
                                            Indicator.ballClipRotateMultiple,
                                        colors: const [bluebg],
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
                                        child: vehicle.length == 0
                                            ? Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: s.width * 0.01),
                                                child: Image.asset(
                                                    "assets/icons/no_vehicles.jpg"),
                                              )
                                            : null),
                                    for (var i = 0;
                                        i < vehicle.length;
                                        i++) ...[
                                      Padding(
                                        padding:
                                            const EdgeInsets.symmetric(vertical: 5.0),
                                        child: VechicleInfoCard(
                                          name: vehicle[i]['name'],
                                          desc: vehicle[i]['description'],
                                          type: vehicle[i]['type'],
                                          status: vehicle[i]['status'],
                                          techname: vehicle[i]['techname'],
                                          username: vehicle[i]['username'],
                                          vdocname: vehicle[i]['docname'],
                                          statusdesc: vehicle[i]['statusdesc'],
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
                    ],
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
