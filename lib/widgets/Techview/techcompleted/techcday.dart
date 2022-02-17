import 'package:flutter/material.dart';
import 'package:test2/componets/assign_pgm_card.dart';
import 'package:test2/componets/view_pgm_card.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';

class Techcday extends StatefulWidget {
  String? uid;
  String? username;
  String? techname;

  Techcday({Key? key, this.uid, this.username, this.techname})
      : super(key: key);

  @override
  _TechcdayState createState() => _TechcdayState();
}

class _TechcdayState extends State<Techcday> {
  @override
  List _allpgm = [];

  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String ccollname = DateFormat('MM d y').format(now);
    return ScrollConfiguration(
            behavior: htechassignswipe(),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('Technician').doc(widget.username).collection("Assignedpgm").snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          print('Something went Wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Expanded(
                            child: Center(
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
                          print(a);
                          a['uid'] = document.id;
                        }).toList();
                        
                        return Container(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              for (var i = 0; i < _allpgm.length; i++) ...[
                                Viewpgmcard(
                                  name: _allpgm[i]["name"],
                                  address: _allpgm[i]["address"],
                                  loc: _allpgm[i]["loc"],
                                  pgm: _allpgm[i]["pgm"],
                                  phn: _allpgm[i]["phn"],
                                  type: _allpgm[i]["type"],
                                  upDate: _allpgm[i]["upDate"],
                                  upTime: _allpgm[i]["upTime"],
                                  docname: _allpgm[i]["docname"],
                                )
                              ]
                            ],
                          ),
                        );
                      }),
            ),);
  }
}

class htechassignswipe extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
