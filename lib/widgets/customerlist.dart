import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:test2/constants/constants.dart';

class Customerlist extends StatelessWidget {
  // Customerlist({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('Customerlist').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Expanded(
              child: Container(
                color: white,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: cheryred,
                  ),
                ),
              ),
            );
          }

          final List _allpgm = [];
          _allpgm.clear();
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            _allpgm.add(a);
            print(a);
            a['uid'] = document.id;
          }).toList();
          List assignedpgm =
              _allpgm.where((i) => i['status'] == 'assigned').toList();
          return Column(
            children: [
              Container(
                width: 10,
                height: 10,
                color: bluebg,
              )
            ],
          );
        });
  }
}
