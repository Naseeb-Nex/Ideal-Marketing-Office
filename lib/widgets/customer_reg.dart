import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:test2/services/customer.dart';

class Customerreg extends StatefulWidget {
  const Customerreg({Key? key}) : super(key: key);

  @override
  _CustomerregState createState() => _CustomerregState();
}

class _CustomerregState extends State<Customerreg> {
  final _formkey = GlobalKey<FormState>();

  bool _loading = false;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController loccontroller = TextEditingController();
  TextEditingController prospeccontroller = TextEditingController();
  TextEditingController instadatecontroller = TextEditingController();
  TextEditingController phn1controller = TextEditingController();
  TextEditingController phn2controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image(
                  image: const AssetImage("assets/images/customer.jpg"),
                  width: s.width * 0.23,
                  height: s.height * 0.2,
                ),
              ),
            ),
            const Center(
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
              height: 20,
            ),
            Wrap(
              children: [
                Row(
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
                              validator: (value) {
                                if (value!.isEmpty) {
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
                              onSaved: (value) {
                                addresscontroller.text = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
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
                Row(
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
                              "Location",
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
                              controller: loccontroller,
                              textInputAction: TextInputAction.next,
                              onSaved: (value) {
                                loccontroller.text = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Please enter the Location");
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
                              "Product Specification",
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
                              controller: prospeccontroller,
                              onSaved: (value) {
                                prospeccontroller.text = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Please enter the Product Specification");
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
                  ],
                ),
                Row(
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
                              "Installation Date",
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
                              controller: instadatecontroller,
                              textInputAction: TextInputAction.next,
                              onSaved: (value) {
                                instadatecontroller.text = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Please enter the Installation Date");
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
                              "Phone Number 1",
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
                              controller: phn1controller,
                              onSaved: (value) {
                                phn1controller.text = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Please enter the Phone Number 1");
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
                  ],
                ),
                Row(
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
                              "Phone Number 2",
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
                              controller: phn2controller,
                              onSaved: (value) {
                                phn2controller.text = value!;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: s.width * 0.2,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: bluebg,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 5))
                    ]),
                child: const Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//   void uploadData() async {
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     DateTime now = DateTime.now();
//     String formattedDate = DateFormat('MM d y kk:mm:ss').format(now);
//     String upDate = DateFormat('d MMM y').format(now);
//     String upTime = DateFormat('kk:mm').format(now);

//     if (_formkey.currentState!.validate()) {
//       setState(() {
//         _loading = true;
//       });

//       Customer custm = Customer(
//           name: namecontroller.text,
//           address: addresscontroller.text,
//           loc: .text,
//           phn: phnController.text,
//           upDate: upDate,
//           upTime: upTime,
//           docname: formattedDate,
//           prospec: productspecController.text,
//           instadate: instadateController.text,
//           );

//       Pgmhistory history = Pgmhistory(
//           name: nameController.text,
//           address: addressController.text,
//           loc: locController.text,
//           phn: phnController.text,
//           pgm: pgmController.text,
//           chrg: chrgController.text,
//           type: _selectedcategory,
//           upDate: upDate,
//           upTime: upTime,
//           docname: formattedDate,
//           prospec: productspecController.text,
//           instadate: instadateController.text,
//           status: "pending",
//           ch: "New program added"
//           );

//       await firebaseFirestore
//           .collection("Programs")
//           .doc(formattedDate)
//           .set(custm.toMap())
//           .then((value) {
//             firebaseFirestore.collection("history").doc(formattedDate).set(history.toMap());
//         showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return const SimpleCustomAlert(
//                   "Program Registration Completed!", bluebg, "Sucessfull");
//             });
//         setState(() {
//           _loading = false;
//         });

//         nameController.clear();
//         addressController.clear();
//         locController.clear();
//         phnController.clear();
//         pgmController.clear();
//         chrgController.clear();
//         productspecController.clear();
//         instadateController.clear();
//       }).catchError((error) {
//         print("Failed to add Program: $error");
//         showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return const  SimpleCustomAlert("Something went Wrong, Try again!",
//                   Colors.redAccent, "Error");
//             });
//         setState(() {
//           _loading = false;
//         });
//       });
//     }
//   }
// }
}
