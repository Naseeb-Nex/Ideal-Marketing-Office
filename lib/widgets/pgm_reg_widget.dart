import 'package:flutter/gestures.dart';
import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/services/pgm.dart';

class Pgmreg extends StatefulWidget {
  String uid;
  Pgmreg({Key? key, required this.uid}) : super(key: key);

  @override
  _PgmregState createState() => _PgmregState();
}

class _PgmregState extends State<Pgmreg> {
  // form
  final _formKey = GlobalKey<FormState>();

  //text Controllers
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController addressController = new TextEditingController();
  final TextEditingController locController = new TextEditingController();
  final TextEditingController phnController = new TextEditingController();
  final TextEditingController pgmController = new TextEditingController();
  final TextEditingController chrgController = new TextEditingController();

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> categorylist = [
      "Follow Up Service",
      "Collection",
      "Installation",
      "Service",
      "Other"
    ];
    return categorylist
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ))
        .toList();
  }

  String? _selectedcategory;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    //name field
    final namefield = TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Name Feild Cannot be empty");
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Full Name",
        labelStyle: TextStyle(
            fontFamily: "Nunito", fontSize: 14, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    //Address field
    final addressfield = TextFormField(
      autofocus: false,
      controller: addressController,
      onSaved: (value) {
        addressController.text = value!;
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Address Feild Cannot be empty");
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Address",
        labelStyle: TextStyle(
            fontFamily: "Nunito", fontSize: 14, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    //location field
    final locfield = TextFormField(
      autofocus: false,
      controller: locController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        locController.text = value!;
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Location Feild Cannot be empty");
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Location",
        labelStyle: TextStyle(
            fontFamily: "Nunito", fontSize: 14, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    //phn field
    final phnfield = TextFormField(
      autofocus: false,
      controller: phnController,
      keyboardType: TextInputType.phone,
      onSaved: (value) {
        phnController.text = value!;
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Phone Number feild can't be empty");
        } else if (value.length != 10) {
          return ("invalid Phone Number");
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Phone Number",
        labelStyle: TextStyle(
            fontFamily: "Nunito", fontSize: 14, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    //program field
    final pgmfield = TextFormField(
      autofocus: false,
      controller: pgmController,
      minLines: 1,
      maxLines: 5,
      keyboardType: TextInputType.multiline,
      onSaved: (value) {
        pgmController.text = value!;
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Program Feild Cannot be empty");
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Program",
        labelStyle: TextStyle(
            fontFamily: "Nunito", fontSize: 14, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    //charge field
    final chrgfield = TextFormField(
      autofocus: false,
      controller: chrgController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        chrgController.text = value!;
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("it can't be empty");
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Charge",
        labelStyle: TextStyle(
            fontFamily: "Nunito", fontSize: 14, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    final categoryselector = InputDecorator(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.edit),
        contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        hintText: "Category",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: new DropdownButtonHideUnderline(
        child: new DropdownButton(
          value: _selectedcategory,
          items: _dropDownItem(),
          onChanged: (value) {
            setState(() {
              _selectedcategory = value as String?;
            });
          },
          hint: Text("Select service type"),
          elevation: 12,
          style: TextStyle(color: Colors.grey, fontSize: 16),
          icon: Icon(Icons.arrow_drop_down_circle),
          iconDisabledColor: Colors.grey,
          iconEnabledColor: Colors.redAccent,
          isExpanded: true,
        ),
      ),
    );

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Text(
            "Program Register",
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
          SizedBox(
            height: 20,
          ),
          Container(
            child: Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          namefield,
                          SizedBox(
                            height: 20,
                          ),
                          locfield,
                          SizedBox(
                            height: 20,
                          ),
                          phnfield,
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        addressfield,
                        SizedBox(
                          height: 20,
                        ),
                        pgmfield,
                        SizedBox(
                          height: 20,
                        ),
                        chrgfield,
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 400,
            child: categoryselector,
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              uploadData();
            },
            child: Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: cheryred,
              ),
              alignment: Alignment.center,
              child: Text(
                "Register Program",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _loading == true
              ? CircularProgressIndicator(
                  color: cheryred,
                )
              : Container()
        ],
      ),
    );
  }

  void uploadData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM d y kk:mm:ss').format(now);
    String upDate = DateFormat('d MMM y').format(now);
    String upTime = DateFormat('kk:mm').format(now);

    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });

      Pgmdata pgmr = Pgmdata(
          uid: widget.uid,
          name: nameController.text,
          address: addressController.text,
          loc: locController.text,
          phn: phnController.text,
          pgm: pgmController.text,
          chrg: chrgController.text,
          type: _selectedcategory,
          upDate: upDate,
          upTime: upTime,
          docname: formattedDate,
          status: "pending");

      await firebaseFirestore
          .collection("Programs")
          .doc("$formattedDate")
          .set(pgmr.toMap())
          .then((value) {
        print("Successfully Program created");
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleCustomAlert(
                  "Program Registration Completed!", bluebg, "Sucessfull");
            });
        setState(() {
          _loading = false;
        });

        nameController.clear();
        addressController.clear();
        locController.clear();
        phnController.clear();
        pgmController.clear();
        chrgController.clear();
      }).catchError((error) {
        print("Failed to add Program: $error");
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleCustomAlert("Something went Wrong, Try again!",
                  Colors.redAccent, "Error");
            });
        setState(() {
          _loading = false;
        });
      });
    }
  }
}

class SimpleCustomAlert extends StatelessWidget {
  final String? titles;
  final Color colorr;
  final String? done;
  SimpleCustomAlert(this.titles, this.colorr, this.done);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: colorr,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 200,
        width: 450,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: primarybg,
                    size: 30,
                  ),
                  Text(
                    done!,
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              titles!,
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 28,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: white,
              child: Text(
                "Okay",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: colorr,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
