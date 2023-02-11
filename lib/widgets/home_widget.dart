import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/widgets/export_widget.dart';
import 'package:test2/screens/homesrc.dart';

import 'package:intl/intl.dart';
import 'package:flutter/gestures.dart';
import 'package:test2/componets/vscroll.dart';
import 'package:test2/widgets/vehicleportal_widget.dart';

// ignore: must_be_immutable
class Homewidget extends StatefulWidget {
  String? uid;
  Homewidget({Key? key, this.uid}) : super(key: key);

  @override
  _HomewidgetState createState() => _HomewidgetState();
}

class _HomewidgetState extends State<Homewidget> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  int p = 0, c = 0;
  @override
  void initState() {
    super.initState();
    if (mounted) {
      pgmsetup();
    }
  }

  final List techprofile = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              "Home",
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xff8F9194),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Flexible(
                      flex: 3,
                      child: SizedBox(
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: cheryred),
                                ),
                                const Text(
                                  " Pending Programs",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff273746),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "$p",
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff273746),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Flexible(
                      flex: 3,
                      child: SizedBox(
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.greenAccent),
                                ),
                                const Text(
                                  " Completed Programs",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff273746),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "$c",
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff273746),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
          Row(
            children: const [
              SizedBox(
                width: 50,
              ),
              Icon(
                Icons.person,
                color: Colors.black26,
              ),
              Text(
                "  Technicians",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 100,
              ),
              Container(
                height: 2,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: size.height * 0.55,
            child: Example(
              userid: widget.uid,
            ),
          )
        ],
      ),
    );
  }

  pgmsetup() async {
    DateTime now = DateTime.now();
    String cday = DateFormat('MM d y').format(now);
    try {
      await fb
          .collection('Completedpgm')
          .doc("Day")
          .collection(cday)
          .get()
          .then((snap) => {
                setState(() {
                  c = snap.size;
                })
              });
      await fb.collection('Programs').get().then((snap) => {
            setState(() {
              p = snap.size;
            })
          });
    } catch (e) {
      print(e);
    }
  }
}

// ignore: must_be_immutable
class Example extends StatelessWidget {
  String? userid;
  Example({Key? key, this.userid}) : super(key: key);
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('Technician').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: cheryred,
              ),
            );
          }

          final List techprofile = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            techprofile.add(a);
            a['uid'] = document.id;
          }).toList();
          return ScrollConfiguration(
            behavior: Vscroll(),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: techprofile.length,
              itemBuilder: (context, i) {
                return Techcard(
                  name: techprofile[i]['name'],
                  img: techprofile[i]['pic'],
                  username: techprofile[i]['username'],
                  uid: techprofile[i]['uid'],
                );
              },
            ),
          );
        });
  }
}

// ignore: must_be_immutable
class Techcard extends StatefulWidget {
  String? name;
  String? img;
  String? uid;
  String? username;
  Techcard({Key? key, this.name, this.img, this.uid, this.username})
      : super(key: key);

  @override
  _TechcardState createState() => _TechcardState();
}

class _TechcardState extends State<Techcard> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  int a = 0;
  int c = 0;
  int p = 0;
  int pro = 0;
  @override
  void initState() {
    super.initState();
    if (mounted) startup();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFBFCFC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 15,
      shadowColor: primarybg,
      child: SizedBox(
        width: 250,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage("assets/icons/avataricon.png"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${widget.name}",
                style: const TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff273746),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow),
                  ),
                  const Text(
                    " Assingned Programs    ",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff273746),
                    ),
                  ),
                  Text(
                    "$a",
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff273746),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.greenAccent),
                  ),
                  const Text(
                    " Completed Programs   ",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff273746),
                    ),
                  ),
                  Text(
                    "$c",
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff273746),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: cheryred),
                  ),
                  const Text(
                    " Pending Programs        ",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff273746),
                    ),
                  ),
                  Text(
                    "$p",
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff273746),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                  ),
                  const Text(
                    " Processing Programs   ",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff273746),
                    ),
                  ),
                  Text(
                    "$pro",
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff273746),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Assigntechpgm(
                          uid: widget.uid,
                          name: widget.name,
                          username: widget.username,
                        ))),
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40), color: cheryred),
                  alignment: Alignment.center,
                  child: const Text(
                    "Assign Program",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  startup() async {
    DateTime now = DateTime.now();
    String cday = DateFormat('MM d y').format(now);
    try {
      await fb
          .collection('Technician')
          .doc(widget.username)
          .collection("Assignedpgm")
          .get()
          .then((snap) => {
                setState(() {
                  a = snap.size;
                })
              });

      await fb
          .collection('Technician')
          .doc(widget.username)
          .collection("Completedpgm")
          .doc("Day")
          .collection(cday)
          .get()
          .then((snap) => {
                setState(() {
                  c = snap.size;
                })
              });
      await fb
          .collection('Technician')
          .doc(widget.username)
          .collection("Pendingpgm")
          .get()
          .then((snap) => {
                setState(() {
                  p = snap.size;
                })
              });

      await fb
          .collection('Technician')
          .doc(widget.username)
          .collection("Processingpgm")
          .get()
          .then((snap) => {
                setState(() {
                  pro = snap.size;
                })
              });
    } catch (e) {
      print(e);
    }
  }
}

// ignore: must_be_immutable
class Assigntechpgm extends StatefulWidget {
  String? username;
  String? name;
  String? uid;

  Assigntechpgm({Key? key, this.name, this.uid, this.username})
      : super(key: key);

  @override
  _AssigntechpgmState createState() => _AssigntechpgmState();
}

class _AssigntechpgmState extends State<Assigntechpgm> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  int a = 0;
  int c = 0;
  int p = 0;
  int pro = 0;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      startup();
    }
  }

  String _currentsrc = "Assign";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 60,
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OfficeHome(),
                        )),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OfficeHome(),
                          )),
                      child: const Image(
                        image: AssetImage("assets/icons/imaicon.png"),
                        height: 45,
                        filterQuality: FilterQuality.high,
                      ),
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
                height: double.infinity,
                width: 350,
                padding: const EdgeInsets.all(10),
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
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        SizedBox(
                          height: 160,
                          width: 160,
                          child: CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: Image.asset("assets/icons/avataricon.png"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "${widget.name}",
                            style: const TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff273746),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.yellow),
                            ),
                            const Text(
                              " Assingned Programs    ",
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff273746),
                              ),
                            ),
                            Text(
                              "$a",
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff273746),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.greenAccent),
                            ),
                            const Text(
                              " Completed Programs   ",
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff273746),
                              ),
                            ),
                            Text(
                              "$c",
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff273746),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: cheryred),
                            ),
                            const Text(
                              " Pending Programs        ",
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff273746),
                              ),
                            ),
                            Text(
                              "$p",
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff273746),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue),
                            ),
                            const Text(
                              " Processing Programs   ",
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff273746),
                              ),
                            ),
                            Text(
                              "$pro",
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff273746),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () => setState(() {
                            _currentsrc = 'Assign';
                          }),
                          child: Container(
                            height: 55,
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: _currentsrc == "Assign"
                                    ? white
                                    : Colors.blue,
                                border: Border.all(color: Colors.blue)),
                            child: Text(
                              "Assign Programs",
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _currentsrc == "Assign"
                                    ? Colors.blue
                                    : white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () => setState(() {
                            _currentsrc = 'Status';
                          }),
                          child: Container(
                            height: 55,
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color:
                                  _currentsrc == "Status" ? white : Colors.blue,
                              border: Border.all(color: Colors.blue),
                            ),
                            child: Text(
                              "Status",
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _currentsrc == "Status"
                                    ? Colors.blue
                                    : white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () => setState(() {
                            _currentsrc = 'Vehicles';
                          }),
                          child: Container(
                            height: 55,
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color:
                                  _currentsrc == "Vehicles" ? white : Colors.blue,
                              border: Border.all(color: Colors.blue),
                            ),
                            child: Text(
                              "Vehicle Grage",
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _currentsrc == "Vehicles"
                                    ? Colors.blue
                                    : white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 10, top: 10, bottom: 5),
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
                    // Use wrapper here
                    child: Techsrcwrapper(
                      src: _currentsrc,
                      uid: widget.uid,
                      username: widget.username,
                      name: widget.name,
                    ),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  startup() async {
    DateTime now = DateTime.now();
    String cday = DateFormat('MM d y').format(now);
    try {
      await fb
          .collection('Technician')
          .doc(widget.username)
          .collection("Assignedpgm")
          .get()
          .then((snap) => {
                setState(() {
                  a = snap.size;
                })
              });

      await fb
          .collection('Technician')
          .doc(widget.username)
          .collection("Completedpgm")
          .doc("Day")
          .collection(cday)
          .get()
          .then((snap) => {
                setState(() {
                  c = snap.size;
                })
              });
      await fb
          .collection('Technician')
          .doc(widget.username)
          .collection("Pendingpgm")
          .get()
          .then((snap) => {
                setState(() {
                  p = snap.size;
                })
              });
      await fb
          .collection('Technician')
          .doc(widget.username)
          .collection("Processingpgm")
          .get()
          .then((snap) => {
                setState(() {
                  pro = snap.size;
                })
              });
    } catch (e) {
      print(e);
    }
  }
}

// ignore: must_be_immutable
class Techsrcwrapper extends StatelessWidget {
  String? src;
  String? uid;
  String? username;
  String? name;
  Techsrcwrapper({Key? key, this.src, this.uid, this.username, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (src == 'Status') {
      return Statussrc(uid: uid, username: username, techname: name);
    }else if (src == 'Vehicles') {
      return VehiclePortalWidget(username: username, techname: name);
    }
    return Assignpgmwidget(uid: uid, username: username, techname: name);
  }
}

class Hscroll extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
