import 'package:flutter/material.dart';
import 'package:test2/componets/assign_pgm_card.dart';
import 'package:test2/constants/constants.dart';
import 'package:test2/componets/search_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';

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
  @override
  String textquery = '';
  List pgm = [];
  List _allpgm = [];
  List pendingpgm = [];
  List assignpgm = [];
  final Stream<QuerySnapshot> programstream =
      FirebaseFirestore.instance.collection('Programs').snapshots();

  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 700,
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
          child: buildSearch(),
        ),
        const SizedBox(
          height: 30,
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
                        return const Expanded(
                          child: Center(
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

  Widget buildSearch() => SearchWidget(
        text: textquery,
        hintText: 'Name or Phone number',
        onChanged: searchpgm,
      );

  void searchpgm(String query) {
    setState(() {
      pendingpgm = assignpgm.where((pgm) {
        final nameLower = pgm["name"]!.toLowerCase();
        final phnumber = pgm["phn"]!;
        final searchquery = query.toLowerCase();

        return nameLower.contains(searchquery) ||
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
