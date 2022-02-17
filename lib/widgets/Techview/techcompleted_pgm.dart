import 'package:flutter/material.dart';
import 'package:test2/componets/completed_pgm_card.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';

class Techcompleted extends StatefulWidget {
  String? uid;
  String? username;
  String? techname;

  Techcompleted({Key? key, this.uid, this.username, this.techname})
      : super(key: key);

  @override
  _TechcompletedState createState() => _TechcompletedState();
}

class _TechcompletedState extends State<Techcompleted> {
  @override
  List _allpgm = [];

  Widget build(BuildContext context) {
    return ScrollConfiguration(
            behavior: htechassignswipe(),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('Technician').doc(widget.username).collection("Pendingpgm").snapshots(),
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
                                Completedpgmcard(
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