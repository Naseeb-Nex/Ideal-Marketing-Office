import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';

class Customerreg extends StatefulWidget {
  const Customerreg({Key? key}) : super(key: key);

  @override
  _CustomerregState createState() => _CustomerregState();
}

class _CustomerregState extends State<Customerreg> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phncontroller = TextEditingController();
  TextEditingController prospeccontroller = TextEditingController();
  TextEditingController instadate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 30, top: 30),
          child: Text(
            "Customer Registraion",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Form(
          key: _formkey,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: s.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Full Name",
                        style: TextStyle(fontFamily: "Nunito", fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                          autofocus: false,
                          controller: namecontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Flexible(flex: 1, fit: FlexFit.tight, child: Text("2"))
            ],
          ),
        )
      ],
    );
  }
}
