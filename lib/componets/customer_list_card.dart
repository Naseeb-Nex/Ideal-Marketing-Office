import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';
import 'package:test2/screens/customer_profile.dart';
import 'package:test2/services/customer.dart';

// ignore: must_be_immutable
class CustomerListCard extends StatefulWidget {
  String? name;
  String? address;
  String? loc;
  String? phn1;
  String? phn2;
  String? upDate;
  String? upTime;
  String? docname;
  String? prospec;
  String? instadate;
  String? custdocname;

  CustomerListCard({
    Key? key,
    this.name,
    this.address,
    this.loc,
    this.phn1,
    this.phn2,
    this.upDate,
    this.upTime,
    this.docname,
    this.prospec,
    this.instadate,
    this.custdocname,
  }) : super(key: key);

  @override
  State<CustomerListCard> createState() => CustomerListCardState();
}

class CustomerListCardState extends State<CustomerListCard> {
  @override
  Widget build(BuildContext context) {
    final cust = Customer(
      name: widget.name,
      address: widget.address,
      loc: widget.loc,
      phn1: widget.phn1,
      phn2: widget.phn2,
      upDate: widget.upDate,
      upTime: widget.upTime,
      docname: widget.docname,
      prospec: widget.prospec,
      instadate: widget.instadate,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onDoubleTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => CustomerProfilesrc(
                                docname: widget.docname,
                                cust: cust,
                              ))),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
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
              const Icon(
                Icons.account_circle_outlined,
                color: bluebg,
              ),
              Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
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
                  flex: 3,
                  child: Text(
                    "${widget.address}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
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
              SizedBox(
                width: 145,
                child: Center(
                  child: Text(
                    "${widget.phn1}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => CustomerProfilesrc(
                                docname: widget.docname,
                                cust: cust,
                              ))),
                  child: const SizedBox(
                    width: 50,
                    child: Icon(
                      Icons.more_horiz_rounded,
                      color: Colors.black45,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
