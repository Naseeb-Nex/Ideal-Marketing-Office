import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';

class Viewpgmcard extends StatefulWidget {
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? type;
  String? pgm;
  String? upDate;
  String? upTime;
  String? docname;
  String? prospec;
  String? instadate;

  Viewpgmcard({
    Key? key,
    this.name,
    this.address,
    this.loc,
    this.phn,
    this.type,
    this.pgm,
    this.upDate,
    this.upTime,
    this.docname,
    this.prospec,
    this.instadate,
  }) : super(key: key);

  @override
  State<Viewpgmcard> createState() => _ViewpgmcardState();
}

class _ViewpgmcardState extends State<Viewpgmcard> {
  bool vis = false;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 5,
              color: secondbg.withOpacity(0.18),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: s.width * 0.13,
                      child: Text(
                        "${widget.name}",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      width: s.width * 0.13,
                      child: Text(
                        "${widget.address}",
                        style: const TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 16,
                            color: Colors.black54),
                      ),
                    ),
                    Text(
                      "${widget.loc}",
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 15,
                          color: Colors.black45,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: s.width * 0.41,
                      child: Text(
                        "${widget.pgm}",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "${widget.phn}",
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 15,
                          color: Colors.black54),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "${widget.upDate}",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "${widget.upTime}",
                          style: const TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () => setState(() {
                            vis = !vis;
                          }),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      color: Colors.black.withOpacity(0.1),
                                      // offset: const Offset(0, 5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.all(2),
                              child: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black38,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Visibility(
              visible: vis,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: bluebg,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        "${widget.type}",
                        style: const TextStyle(
                            fontFamily: "Nunito", fontSize: 15, color: white),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "${widget.prospec}",
                      style: const TextStyle(
                          fontFamily: "Montserrat", fontSize: 17),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "${widget.instadate}",
                      style: const TextStyle(
                          fontFamily: "Montserrat", fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
