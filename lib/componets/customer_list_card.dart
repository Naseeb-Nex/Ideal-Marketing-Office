import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';

// ignore: must_be_immutable
class CustomerListCard extends StatefulWidget {
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? docname;

  CustomerListCard({
    Key? key,
    this.name,
    this.address,
    this.loc,
    this.phn,
    this.docname,
  }) : super(key: key);

  @override
  State<CustomerListCard> createState() => CustomerListCardState();
}

class CustomerListCardState extends State<CustomerListCard> {
  bool vis = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 5),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 5,
              color: secondbg.withOpacity(0.18),
            ),
          ],
        ),
        child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Center(
                                child: Text(
                                  "${widget.name}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              )),
                          Flexible(
                              fit: FlexFit.tight,
                              flex: 2,
                              child: Center(
                                child: Text(
                                  "${widget.address}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Montserrat",
                                    ),
                                ),
                              )),
                          Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Center(
                                child: Text(
                                  "${widget.loc}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Montserrat",
                                    ),
                                ),
                              )),
                          Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Center(
                                child: Text(
                                  "${widget.phn}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Montserrat",
                                    ),
                                ),
                              )),
                        ],
                      ),
      ),
    );
  }
}
