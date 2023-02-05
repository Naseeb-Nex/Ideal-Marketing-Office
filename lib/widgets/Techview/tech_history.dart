import 'package:flutter/material.dart';
import 'package:test2/componets/Techhistory_card.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';

// ignore: must_be_immutable
class Techhistoryview extends StatefulWidget {
  String? uid;
  String? username;
  String? techname;

  Techhistoryview({Key? key, this.uid, this.username, this.techname})
      : super(key: key);

  @override
  _TechhistoryviewState createState() => _TechhistoryviewState();
}

class _TechhistoryviewState extends State<Techhistoryview> {
  List _allpgm = [];

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: htechassignswipe(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Technician')
                .doc(widget.username)
                .collection("History")
                .limit(50)
                .orderBy("docname", descending: true)
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
                a['uid'] = document.id;
              }).toList();

              return Column(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  for (var i = 0; i < _allpgm.length; i++) ...[
                    Techhistorycard(
                      name: _allpgm[i]['name'],
                      loc: _allpgm[i]['loc'],
                      pgm: _allpgm[i]['pgm'],
                      chrg: _allpgm[i]['chrg'],
                      upDate: _allpgm[i]['upDate'],
                      upTime: _allpgm[i]['upTime'],
                      docname: _allpgm[i]['docname'],
                      status: _allpgm[i]['status'],
                      remarks: _allpgm[i]['remarks'],
                      collection: _allpgm[i]['collection'],
                      username: _allpgm[i]['username'],
                    )
                  ]
                ],
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
