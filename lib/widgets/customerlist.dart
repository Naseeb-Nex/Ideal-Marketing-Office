import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/componets/customer_list_card.dart';

import 'package:test2/constants/constants.dart';

class Customerlist extends StatelessWidget {
  Customerlist({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('Customer').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: cheryred,
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
          
          return Column(
            children: [
           const SizedBox(
                width: 30,
              ),
              for (var i = 0; i < _allpgm.length; i++) ...[
                CustomerListCard(
                  name: _allpgm[i]["name"],
                  address: _allpgm[i]["address"],
                  loc: _allpgm[i]["loc"],
                  phn: _allpgm[i]["phn1"],
                  docname: _allpgm[i]["docname"],
                )
              ]
            ],
          );
        });
  }
}
