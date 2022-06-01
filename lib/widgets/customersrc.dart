import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';

class Customersrc extends StatefulWidget {
  const Customersrc({Key? key}) : super(key: key);

  @override
  _CustomersrcState createState() => _CustomersrcState();
}

class _CustomersrcState extends State<Customersrc> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Viewer",
          style: TextStyle(
            fontFamily: "Nunito",
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black38,
          ),
        ),
        Container(
          height: 5,
          width: 36,
          decoration: BoxDecoration(
              color: Colors.black26, borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(
          height: 20,
        ),
        
      ],
    );
  }
}
