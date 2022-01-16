import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';

class Homewidget extends StatefulWidget {
  String? uid;
  Homewidget({Key? key, this.uid}) : super(key: key);

  @override
  _HomewidgetState createState() => _HomewidgetState();
}

class _HomewidgetState extends State<Homewidget> {
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
                                "10",
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
                                        color: Colors.yellow),
                                  ),
                                  Text(
                                    " Assigned Programs",
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
                                "10",
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
                                "10",
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
}

class Techcard extends StatefulWidget {
  String? name;
  String? img;
  Techcard({Key? key, this.name, this.img}) : super(key: key);

  @override
  _TechcardState createState() => _TechcardState();
}

class _TechcardState extends State<Techcard> {
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
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff273746),
                  ),
                ),
                Text(
                  "10",
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
                  "10",
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
                  "10",
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
            Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: cheryred),
              alignment: Alignment.center,
              child: Text(
                "Add Program",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
            )
          ],
        ),
      ),
    );
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
                  )
                ]
              ],
            ),
          );
        });
  }
}
