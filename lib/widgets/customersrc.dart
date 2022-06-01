import 'package:test2/componets/search_box.dart';
import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';

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
                fontFamily: "Montserrat",
                fontSize: 22,
                fontWeight: FontWeight.w500),
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
                    offset: const Offset(0, 3)
                  )
                ]),
                // child: ,
          ),
        ),
        const SizedBox(height: 10,),
        
      ],
    );
  }

}
