import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/componets/customer_list_card.dart';

class Customersrc extends StatefulWidget {
  const Customersrc({Key? key}) : super(key: key);

  @override
  _CustomersrcState createState() => _CustomersrcState();
}

class _CustomersrcState extends State<Customersrc> {
  String textquery = '';

  List _allcustomer = [];
  List resultc = [];

  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('Customer').snapshots();

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    const styleActive = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.black54);
    final style = controller.text.isEmpty ? styleHint : styleActive;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 30, top: 20),
          child: Text(
            "Customer Details",
            style: TextStyle(
              fontFamily: "Nunito",
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.only(
                    left: s.width * 0.1, right: s.width * 0.15, top: 10),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 5))
                      ]),
                  child: Container(
                    height: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        icon: Icon(Icons.search, color: style.color),
                        suffixIcon: controller.text.isNotEmpty
                            ? GestureDetector(
                                child: Icon(Icons.close, color: style.color),
                                onTap: () {
                                  controller.clear();
                                  searchcustomer('');
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                              )
                            : null,
                        hintText: "Search",
                        hintStyle: style,
                        border: InputBorder.none,
                      ),
                      style: style,
                      onChanged: searchcustomer,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: bluebg),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 18,
                          ),
                          Flexible(
                              flex: 2,
                              fit: FlexFit.tight,
                              child: Center(
                                child: Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold,
                                      color: white),
                                ),
                              )),
                          Flexible(
                              fit: FlexFit.tight,
                              flex: 3,
                              child: Text(
                                "Address",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: white),
                              )),
                          Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Center(
                                child: Text(
                                  "Location",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold,
                                      color: white),
                                ),
                              )),
                          SizedBox(
                            width: 145,
                            child: Center(
                              child: Text(
                                "Phone Number",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: StreamBuilder<QuerySnapshot>(
                              stream: studentsStream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  print('Something went Wrong');
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
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
                                snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                                  Map a =
                                      document.data() as Map<String, dynamic>;
                                  _allcustomer.add(a);
                                  a['uid'] = document.id;
                                }).toList();

                                if (controller.text.isEmpty) {
                                  resultc = _allcustomer;
                                }

                                return Column(
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    for (var i = 0;
                                        i < resultc.length;
                                        i++) ...[
                                      CustomerListCard(
                                        name: resultc[i]['name'],
                                        address: resultc[i]['address'],
                                        loc: resultc[i]['loc'],
                                        phn1: resultc[i]['phn1'],
                                        phn2: resultc[i]['phn2'],
                                        upDate: resultc[i]['upDate'],
                                        upTime: resultc[i]['upTime'],
                                        docname: resultc[i]['docname'],
                                        prospec: resultc[i]['prospec'],
                                        instadate: resultc[i]['instadate'],
                                      )
                                    ]
                                  ],
                                );
                              })),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void searchcustomer(String query) {
    setState(() {
      resultc = _allcustomer.where((pgm) {
        final nameLower = pgm["name"]!.toLowerCase();
        final addressLower = pgm["address"]!.toLowerCase();
        final locLower = pgm["loc"]!.toLowerCase();
        final phn1umber = pgm["phn1"]!;
        final phn2umber = pgm["phn2"]!;
        final searchquery = query.toLowerCase();

        return nameLower.contains(searchquery) ||
            addressLower.contains(searchquery) ||
            locLower.contains(searchquery) ||
            phn1umber.contains(searchquery) ||
            phn2umber.contains(searchquery);
      }).toList();
    });
    // searching is postponed
  }
}
