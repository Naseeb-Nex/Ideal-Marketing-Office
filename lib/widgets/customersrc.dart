import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:test2/widgets/customerlist.dart';

class Customersrc extends StatefulWidget {
  const Customersrc({Key? key}) : super(key: key);

  @override
  _CustomersrcState createState() => _CustomersrcState();
}

class _CustomersrcState extends State<Customersrc> {
  String textquery = '';
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
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
        Center(
          child: Container(
            height: 40,
            width: s.width * 0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: white,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 6,
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 3))
                ]),
            // child: ,
          ),
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
                padding: const EdgeInsets.all(10),
                child: Customerlist(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
