import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/componets/customer_list_card.dart';
import 'package:test2/componets/view_pgm_card.dart';
import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:test2/services/customer.dart';

// ignore: must_be_immutable
class CustomerHistory extends StatefulWidget {
  Customer cust = Customer();
  CustomerHistory({Key? key, required this.cust}) : super(key: key);

  @override
  _CustomerHistoryState createState() => _CustomerHistoryState();
}

class _CustomerHistoryState extends State<CustomerHistory> {
  List _allcustomer = [];
  List resultc = [];

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Customer')
                      .doc(widget.cust.docname)
                      .collection("Programs")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print('Something went Wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: EdgeInsets.only(top: s.height * 0.24),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: bluebg,
                          ),
                        ),
                      );
                    }

                    _allcustomer.clear();
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map a = document.data() as Map<String, dynamic>;
                      _allcustomer.add(a);
                      a['uid'] = document.id;
                    }).toList();

                    return Column(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        for (var i = 0; i < _allcustomer.length; i++) ...[
                          Viewpgmcard(
                            name: _allcustomer[i]["name"],
                            address: _allcustomer[i]["address"],
                            loc: _allcustomer[i]["loc"],
                            pgm: _allcustomer[i]["pgm"],
                            phn: _allcustomer[i]["phn"],
                            type: _allcustomer[i]["type"],
                            upDate: _allcustomer[i]["upDate"],
                            upTime: _allcustomer[i]["upTime"],
                            prospec: _allcustomer[i]["prospec"],
                            instadate: _allcustomer[i]["instadate"],
                            docname: _allcustomer[i]["docname"],
                          )
                        ]
                      ],
                    );
                  })),
        ),
      ],
    );
  }
}

class CustomeViewpgmcard {}
