import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:test2/componets/view_pgm_card.dart';
import 'package:test2/constants/constants.dart';

// ignore: must_be_immutable
class Assignedpgmwrapper extends StatelessWidget {
  String? userid;
  Assignedpgmwrapper({Key? key, this.userid}) : super(key: key);
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('Programs').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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

          final List _allpgm = [];
          _allpgm.clear();
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            _allpgm.add(a);
            a['uid'] = document.id;
          }).toList();
          List assignedpgm =
              _allpgm.where((i) => i['status'] == 'assigned').toList();
          return Column(
            children: [
              const SizedBox(
                width: 30,
              ),
              for (var i = 0; i < assignedpgm.length; i++) ...[
                Viewpgmcard(
                  name: assignedpgm[i]["name"],
                  address: assignedpgm[i]["address"],
                  loc: assignedpgm[i]["loc"],
                  pgm: assignedpgm[i]["pgm"],
                  phn: assignedpgm[i]["phn"],
                  type: assignedpgm[i]["type"],
                  upDate: assignedpgm[i]["upDate"],
                  upTime: assignedpgm[i]["upTime"],
                  prospec: assignedpgm[i]["prospec"],
                instadate: assignedpgm[i]["instadate"],
                  docname: assignedpgm[i]["docname"],
                )
              ]
            ],
          );
        });
  }
}
