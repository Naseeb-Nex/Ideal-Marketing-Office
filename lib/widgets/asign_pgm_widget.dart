import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test2/componets/assign_pgm_card.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';

// ignore: must_be_immutable
class Assignpgmwidget extends StatefulWidget {
  String? uid;
  String? username;
  String? techname;

  Assignpgmwidget({Key? key, this.uid, this.username, this.techname})
      : super(key: key);

  @override
  _AssignpgmwidgetState createState() => _AssignpgmwidgetState();
}

class _AssignpgmwidgetState extends State<Assignpgmwidget> {
  String textquery = '';
  List pgm = [];
  List _allpgm = [];

  List pendingpgm = [];
  List assignpgm = [];

  final controller = TextEditingController();

  final Stream<QuerySnapshot> programstream =
      FirebaseFirestore.instance.collection('Programs').snapshots();
  double animSize = 0;
  bool vButton = false;

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.black54);
    final style = controller.text.isEmpty ? styleHint : styleActive;

    // Size
    Size s = MediaQuery.of(context).size;

    return Column(
      children: [
        Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: s.width * 0.5,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primarybg,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 5,
                        color: secondbg.withOpacity(0.20),
                      ),
                    ],
                  ),
                  child: Container(
                    height: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        icon: Icon(Icons.search, color: style.color),
                        suffixIcon: controller.text.isNotEmpty
                            ? GestureDetector(
                                child: Icon(Icons.close, color: style.color),
                                onTap: () {
                                  controller.clear();
                                  searchpgm('');
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                              )
                            : null,
                        hintText: "Search here",
                        hintStyle: style,
                        border: InputBorder.none,
                      ),
                      style: style,
                      onChanged: searchpgm,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: AnimatedContainer(
                              width: animSize,
                              height: animSize,
                              duration: const Duration(milliseconds: 1400),
                              curve: Curves.fastOutSlowIn,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bluebg,
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      color: bluebg.withOpacity(0.25),
                                      offset: const Offset(0, 4),
                                    )
                                  ]),
                              child: const Icon(
                                Iconsax.tag_cross,
                                color: white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: AnimatedContainer(
                              width: animSize,
                              height: animSize,
                              duration: const Duration(milliseconds: 1200),
                              curve: Curves.fastOutSlowIn,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bluebg,
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      color: bluebg.withOpacity(0.25),
                                      offset: const Offset(0, 4),
                                    )
                                  ]),
                              child: const Icon(
                                Icons.directions_bike_rounded,
                                color: white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: AnimatedContainer(
                              width: animSize,
                              height: animSize,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastOutSlowIn,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bluebg,
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      color: bluebg.withOpacity(0.25),
                                      offset: const Offset(0, 4),
                                    )
                                  ]),
                              child: const Icon(
                                Iconsax.add,
                                color: white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            vButton = !vButton;
                          });
                          if (animSize == 35) {
                            setState(() {
                              animSize = 0;
                            });
                          } else {
                            setState(() {
                              animSize = 35;
                            });
                          }
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: vButton ? white : bluebg,
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  color: bluebg.withOpacity(0.25),
                                  offset: const Offset(0, 4),
                                )
                              ]),
                          child: vButton
                              ? const Center(
                                  child: Text(
                                    "X",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: bluebg,
                                    ),
                                  ),
                                )
                              : const Icon(
                                  Icons.directions_bike_rounded,
                                  color: white,
                                ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ScrollConfiguration(
              behavior: VerticalScrollgesture(),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: StreamBuilder<QuerySnapshot>(
                    stream: programstream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print('Something went Wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          width: double.infinity,
                          color: white,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: cheryred,
                            ),
                          ),
                        );
                      }
                      _allpgm.clear();
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map a = document.data() as Map<String, dynamic>;
                        _allpgm.add(a);
                        a['uid'] = document.id;
                      }).toList();

                      //filtering pending programs
                      assignpgm = _allpgm
                          .where((i) => i['status'] == 'pending')
                          .toList();

                      if (controller.text.isEmpty) {
                        pendingpgm = assignpgm;
                      }

                      return Column(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          for (var i = 0; i < pendingpgm.length; i++) ...[
                            Assignpgmcard(
                              uid: pendingpgm[i]["uid"],
                              name: pendingpgm[i]["name"],
                              address: pendingpgm[i]["address"],
                              loc: pendingpgm[i]["loc"],
                              pgm: pendingpgm[i]["pgm"],
                              chrg: pendingpgm[i]["chrg"],
                              phn: pendingpgm[i]["phn"],
                              type: pendingpgm[i]["type"],
                              upDate: pendingpgm[i]["upDate"],
                              upTime: pendingpgm[i]["upTime"],
                              docname: pendingpgm[i]["docname"],
                              prospec: pendingpgm[i]["prospec"],
                              instadate: pendingpgm[i]["instadate"],
                              custdocname: pendingpgm[i]["custdocname"],
                              techuid: widget.uid,
                              techname: widget.techname,
                              username: widget.username,
                            )
                          ]
                        ],
                      );
                    }),
              ),
            ),
          ),
        )
      ],
    );
  }

  void searchpgm(String query) {
    setState(() {
      pendingpgm = assignpgm.where((pgm) {
        final nameLower = pgm["name"]!.toLowerCase();
        final addressLower = pgm["address"]!.toLowerCase();
        final locLower = pgm["loc"]!.toLowerCase();

        final phnumber = pgm["phn"]!;
        final searchquery = query.toLowerCase();

        return nameLower.contains(searchquery) ||
            addressLower.contains(searchquery) ||
            locLower.contains(searchquery) ||
            phnumber.contains(searchquery);
      }).toList();
    });
    // searching is postponed
  }
}

class VerticalScrollgesture extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
