import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';


class Customerreg extends StatefulWidget {
  const Customerreg({Key? key}) : super(key: key);

  @override
  _CustomerregState createState() => _CustomerregState();
}

class _CustomerregState extends State<Customerreg> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 30, top: 20),
          child: Text(
            "Customer Registraion",
            style: TextStyle(
              fontFamily: "Nunito",
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        
      ],
    );
  }
}
