import 'package:flutter/material.dart';
import 'package:test2/componets/invoice_service.dart';
import 'package:test2/componets/view_pgm_card.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';

// ignore: must_be_immutable
class Techasign extends StatefulWidget {
  String? uid;
  String? username;
  String? techname;

  Techasign({Key? key, this.uid, this.username, this.techname})
      : super(key: key);

  @override
  _TechasignState createState() => _TechasignState();
}

class _TechasignState extends State<Techasign> {
  List _allpgm = [];
  bool downloading = false;
  final PdfInvoiceService invoice = PdfInvoiceService();

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: htechassignswipe(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Technician')
                .doc(widget.username)
                .collection("Assignedpgm")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              _allpgm.sort((a, b) => a["priority"].compareTo(b["priority"]));

              return Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      for (var i = 0; i < _allpgm.length; i++) ...[
                        Viewpgmcard(
                          name: _allpgm[i]["name"],
                          address: _allpgm[i]["address"],
                          loc: _allpgm[i]["loc"],
                          pgm: _allpgm[i]["pgm"],
                          phn: _allpgm[i]["phn"],
                          type: _allpgm[i]["type"],
                          upDate: _allpgm[i]["upDate"],
                          upTime: _allpgm[i]["upTime"],
                          docname: _allpgm[i]["docname"],
                          prospec: _allpgm[i]["prospec"],
                          instadate: _allpgm[i]["instadate"],
                        )
                      ]
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          setState(() {
                            downloading = true;
                          });
                          final data = await invoice.createInvoice(
                              _allpgm, "${widget.techname}");
                          invoice.savePdfFile("invoice", data);
                          setState(() {
                            downloading = false;
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: bluebg,
                          ),
                          child: Stack(
                            children: [
                              const Center(
                                  child: Icon(Icons.download, color: white)),
                              Positioned(
                                  right: 0,
                                  top: 0,
                                  child: SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: downloading
                                        ? const CircularProgressIndicator(
                                            color: Color(0XFF219ebc),
                                          )
                                        : null,
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class htechassignswipe extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
