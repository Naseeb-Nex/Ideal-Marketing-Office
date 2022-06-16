import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:test2/services/user_model.dart';
import 'package:test2/widgets/export_widget.dart';

class OfficeHome extends StatefulWidget {
  const OfficeHome({Key? key}) : super(key: key);

  @override
  _OfficeHomeState createState() => _OfficeHomeState();
}

class _OfficeHomeState extends State<OfficeHome> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  String? currentscr = "customer";
  @override
  void initState() {
    super.initState();
    if (mounted) {
      try {
        FirebaseFirestore.instance
            .collection("users")
            .doc(user!.uid)
            .get()
            .then((value) {
          loggedInUser = UserModel.fromMap(value.data());
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 60.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(5)),
              color: white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                  color: secondbg.withOpacity(0.20),
                ),
              ],
            ),
            child: Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                  ),
                  child: Center(
                    child: Image(
                      image: AssetImage("assets/icons/imaicon.png"),
                      height: 45,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 60,
                  width: 280,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          blurRadius: 20,
                          color: secondbg.withOpacity(0.20),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () => setState(() {
                              currentscr = 'Home';
                            }),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: cheryred),
                              child: const Text(
                                "Home",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Center(
                            child: Text(
                              "Progam Management",
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD3D3D3),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () => setState(() {
                              currentscr = 'View';
                            }),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: cheryred),
                              child: const Text(
                                "View All",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () => setState(() {
                              currentscr = 'PgmReg';
                            }),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: cheryred),
                              child: const Text(
                                "Register Program",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () => setState(() {
                              currentscr = 'customer';
                            }),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: cheryred),
                              child: const Text(
                                "Customer",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () => setState(() {
                              currentscr = 'customerreg';
                            }),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: cheryred),
                              child: const Text(
                                "Customer Registration",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.only(right: 10, top: 10, bottom: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            blurRadius: 20,
                            color: secondbg.withOpacity(0.20),
                          ),
                        ],
                      ),
                      // child: Pgmreg(uid: user!.uid),
                      child: Widgetwrapper(
                        src: currentscr,
                        uid: user!.uid,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Widgetwrapper extends StatelessWidget {
  String? src;
  String? uid;
  Widgetwrapper({Key? key, this.src, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (src == 'PgmReg') {
      return Pgmreg(
        uid: uid!,
      );
    } else if (src == 'customer') {
      return const Customersrc();
    } else if (src == 'customerreg') {
      return const Customerreg();
    } else if (src == 'View') {
      return const Pgmviewer();
    }
    return Homewidget(
      uid: uid,
    );
  }
}
