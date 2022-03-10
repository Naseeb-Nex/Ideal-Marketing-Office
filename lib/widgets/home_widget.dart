import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/widgets/export_widget.dart';
import 'package:test2/screens/homesrc.dart';

import 'package:intl/intl.dart';

class Homewidget extends StatefulWidget {
  String? uid;
  Homewidget({Key? key, this.uid}) : super(key: key);

  @override
  _HomewidgetState createState() => _HomewidgetState();
}

class _HomewidgetState extends State<Homewidget> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  int p=0, c=0;
  @override
  void initState() {
    super.initState();
    pgmsetup();
  }
  final List techprofile = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text(
              "Home",
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xff8F9194),
              ),
            ),
            Container(
              height: 5,
              width: 36,
              decoration: BoxDecoration(
                  color: Color(0xff8F9194),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 100,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Flexible(
                        flex: 3,
                        child: Container(
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
                                  Text(
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
                                style: TextStyle(
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
                        child: Container(
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
                                  Text(
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
                                style: TextStyle(
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
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
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
                ],
              ),
            ),
            SizedBox(height: 10),
            Example(
              userid: widget.uid,
            )
          ],
        ),
      ),
    );
  }
  pgmsetup() async{
    DateTime now = DateTime.now();
    String cday = DateFormat('MM d y').format(now);
        
    await fb
        .collection('Completedpgm')
        .doc("Day")
        .collection(cday)
        .get()
        .then((snap) => {
          setState(() {
       this.c = snap.size;
     })
});
    await fb
        .collection('Programs')
        .get()
        .then((snap) => {
          setState(() {
       this.p = snap.size;
     })
});
  }
}

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
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  CircularProgressIndicator(
                    color: cheryred,
                  ),
                ],
              ),
            );
          }

          final List techprofile = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            techprofile.add(a);
            print(a);
            a['uid'] = document.id;
          }).toList();
          return Container(
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                for (var i = 0; i < techprofile.length; i++) ...[
                  Techcard(
                    name: techprofile[i]['name'],
                    img: techprofile[i]['pic'],
                    username: techprofile[i]['username'],
                    uid: techprofile[i]['uid'],
                  )
                ]
              ],
            ),
          );
        });
  }
}

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
  @override
  void initState() {
    super.initState();
    startup();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFBFCFC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 12,
      shadowColor: primarybg,
      child: Container(
        height: 350,
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: AssetImage("assets/icons/avataricon.png"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${widget.name}",
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff273746),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => startup(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow),
                  ),
                  Text(
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
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff273746),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
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
                Text(
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
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff273746),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: cheryred),
                ),
                Text(
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
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff273746),
                  ),
                ),
              ],
            ),
            SizedBox(
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
                child: Text(
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
    );
  }
  startup() async{
    DateTime now = DateTime.now();
    String cday = DateFormat('MM d y').format(now);

    await fb
        .collection('Technician')
        .doc(widget.username)
        .collection("Assignedpgm")
        .get()
        .then((snap) => {
          setState(() {
       this.a = snap.size;
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
       this.c = snap.size;
     })
});
    await fb
        .collection('Technician')
        .doc(widget.username)
        .collection("Pendingpgm")
        .get()
        .then((snap) => {
          setState(() {
       this.p = snap.size;
     })
});
  }
}

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startup();
  }
 
  @override
  String _currentsrc = "Assign";
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(5)),
              color: white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 10,
                  color: secondbg.withOpacity(0.20),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OfficeHome(),
                          )),
                      child: Image(
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
                padding: EdgeInsets.all(10),
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 20,
                          color: secondbg.withOpacity(0.20),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          Container(
                            height: 150,
                            width: 150,
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              backgroundImage:
                                  AssetImage("assets/icons/avataricon.png"),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${widget.name}",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff273746),
                            ),
                          ),
                          SizedBox(
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
                              Text(
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
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff273746),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
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
                              Text(
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
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff273746),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
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
                              Text(
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
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff273746),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
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
                                color: _currentsrc == "Status"
                                    ? white
                                    : Colors.blue,
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 10, top: 10, bottom: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5),
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
  startup() async{
    DateTime now = DateTime.now();
    String cday = DateFormat('MM d y').format(now);

    await fb
        .collection('Technician')
        .doc(widget.username)
        .collection("Assignedpgm")
        .get()
        .then((snap) => {
          setState(() {
       this.a = snap.size;
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
       this.c = snap.size;
     })
});
    await fb
        .collection('Technician')
        .doc(widget.username)
        .collection("Pendingpgm")
        .get()
        .then((snap) => {
          setState(() {
       this.p = snap.size;
     })
});
  }
}

class Techsrcwrapper extends StatelessWidget {
  String? src;
  String? uid;
  String? username;
  String? name;
  Techsrcwrapper({Key? key, this.src, this.uid, this.username, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (src == 'Status')
      return Statussrc(uid: uid, username: username, techname: name);
    return Assignpgmwidget(uid: uid, username: username, techname: name);
  }
}
