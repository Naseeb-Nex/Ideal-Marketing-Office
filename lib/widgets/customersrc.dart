import 'package:firestore_search/firestore_search.dart';
import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:test2/services/customer_data_model.dart';

import 'package:test2/widgets/customerlist.dart';
import 'package:test2/widgets/customer_reg.dart';

import 'package:test2/services/customer_data_model.dart';

class Customersrc extends StatefulWidget {
  const Customersrc({Key? key}) : super(key: key);

  @override
  _CustomersrcState createState() => _CustomersrcState();
}

class _CustomersrcState extends State<Customersrc> {
  String textquery = '';
  bool searchmod = false;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    // return FirestoreSearchScaffold(
    //   firestoreCollectionName: 'Customer',
    //   searchBy: 'docname',
    //   scaffoldBody: Center(
    //     child: Container(width: 199, height: 10, color: bluebg,),
    //   ),
    //   dataListFromSnapshot: CustomerDataModel().dataListFromSnapshot,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       final List<CustomerDataModel>? dataList = snapshot.data;
    //       if (dataList!.isEmpty) {
    //         return const Center(
    //           child: Text('No Results Returned'),
    //         );
    //       }
    //       return ListView.builder(
    //           itemCount: dataList.length,
    //           itemBuilder: (context, index) {
    //             final CustomerDataModel data = dataList[index];

    //             return Column(
    //               mainAxisSize: MainAxisSize.min,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Text(
    //                     '${data.name}',
    //                     style: Theme.of(context).textTheme.headline6,
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(
    //                       bottom: 8.0, left: 8.0, right: 8.0),
    //                   child: Text('${data.address}',
    //                       style: Theme.of(context).textTheme.bodyText1),
    //                 )
    //               ],
    //             );
    //           });
    //     }

    //     if (snapshot.connectionState == ConnectionState.done) {
    //       if (!snapshot.hasData) {
    //         return const Center(
    //           child: Text('No Results Returned'),
    //         );
    //       }
    //     }
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child:  Padding(
                padding:  EdgeInsets.only(left: s.width * 0.1,right: s.width * 0.1, top: 10),
                child: searchmod ? Container(
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
                ): null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 30),
              child: InkWell(
                onTap: () => setState(() {
                  searchmod = !searchmod;
                }),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 2,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 4))
                      ]),
                  child: const Icon(Icons.search),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
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
                      child: Customerlist(),
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
}
