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
                  padding: EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: s.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Full Name",
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        autofocus: false,
                        controller: namecontroller,
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          namecontroller.text = value!;
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return ("Please enter the Name");
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: s.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Address",
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        autofocus: false,
                        controller: addresscontroller,
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          addresscontroller.text = value!;
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return ("Please enter the Address");
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
