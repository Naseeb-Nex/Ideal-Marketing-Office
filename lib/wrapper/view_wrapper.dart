import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:test2/componets/view_pgm_card.dart';
import 'package:test2/constants/constants.dart';

class Pgmwrapper extends StatelessWidget {
  String? userid;
  Pgmwrapper({Key? key, this.userid}) : super(key: key);
  final Stream<QuerySnapshot> programstream =
      FirebaseFirestore.instance.collection('Programs').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: programstream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  color: cheryred,
                ),
              ),
            );
          }

          final List _allpgm = [];
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
          );
        });
  }
}
