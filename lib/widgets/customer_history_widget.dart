import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/componets/customer_pgm_view.dart';
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

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: Colors.black38,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Date",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.format_list_bulleted,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    "Status",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.line_style,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: Colors.black38,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: s.height - 240,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
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
                          Customerpgmview(
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
                            status: _allcustomer[i]["status"],
                            chrg: _allcustomer[i]["chrg"],
                            custdocname: _allcustomer[i]["custdocname"],
                          )
                        ]
                      ],
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomeViewpgmcard {}
