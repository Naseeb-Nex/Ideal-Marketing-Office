import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test2/componets/view_pgm_card.dart';
import 'package:test2/constants/constants.dart';
import 'package:test2/wrapper/view_wrapper.dart';

import 'package:flutter/gestures.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({Key? key}) : super(key: key);

  @override
  _ViewAllState createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                blurRadius: 15,
                color: secondbg.withOpacity(0.20),
              ),
            ],
            color: primarybg),
        child: ListView(
          scrollDirection: Axis.vertical,
          physics:const  BouncingScrollPhysics(),
          children: [
            Pgmwrapper(),
          ],
        ),
      ),
    ));
  }
}