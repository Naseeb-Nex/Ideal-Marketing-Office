import 'package:flutter/material.dart';
import 'package:test2/componets/pending_tech_card.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';

class Techpending extends StatefulWidget {
  String? uid;
  String? username;
  String? techname;

  Techpending({Key? key, this.uid, this.username, this.techname})
      : super(key: key);

  @override
  _TechpendingState createState() => _TechpendingState();
}

class _TechpendingState extends State<Techpending> {
  @override
  List _allpgm = [];

  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: htechassignswipe(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Technician')
                .doc(widget.username)
                .collection("Pendingpgm")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                      PendingTechcard(
                        uid: widget.uid,
                        username: widget.username,
                        name: _allpgm[i]["name"],
                        address: _allpgm[i]["address"],
                        loc: _allpgm[i]["loc"],
                        chrg: _allpgm[i]["chrg"],
                        pgm: _allpgm[i]["pgm"],
                        phn: _allpgm[i]["phn"],
                        type: _allpgm[i]["type"],
                        upDate: _allpgm[i]["upDate"],
                        upTime: _allpgm[i]["upTime"],
                        docname: _allpgm[i]["docname"],
                        remarks: _allpgm[i]["remarks"],
                        ptime: _allpgm[i]["ptime"],
                        pdate: _allpgm[i]["pdate"],
                        pdocname: _allpgm[i]["pdocname"],
                        instadate: _allpgm[i]["instadate"],
                        prospec: _allpgm[i]["prospec"],
                        techname: _allpgm[i]["techname"],
                        custdocname: _allpgm[i]["custdocname"],
                      )
                    ]
                  ],
                ),
              );
            }),
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
