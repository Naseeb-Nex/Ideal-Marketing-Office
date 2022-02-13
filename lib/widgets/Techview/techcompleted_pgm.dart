import 'package:flutter/material.dart';
import 'package:test2/componets/assign_pgm_card.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';

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
  @override
  List _allpgm = [];
  final Stream<QuerySnapshot> programstream =
      FirebaseFirestore.instance.collection('Programs').snapshots();

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ScrollConfiguration(
                behavior: htechassignswipe(),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: programstream,
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
                                Assignpgmcard(
                                  uid: _allpgm[i]["uid"],
                                  name: _allpgm[i]["name"],
                                  address: _allpgm[i]["address"],
                                  loc: _allpgm[i]["loc"],
                                  pgm: _allpgm[i]["pgm"],
                                  chrg: _allpgm[i]["chrg"],
                                  phn: _allpgm[i]["phn"],
                                  type: _allpgm[i]["type"],
                                  upDate: _allpgm[i]["upDate"],
                                  upTime: _allpgm[i]["upTime"],
                                  docname: _allpgm[i]["docname"],
                                  techuid: widget.uid,
                                  techname: widget.techname,
                                  username: widget.username,
                                )
                              ]
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
          )
        ],
      ),
    );
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
