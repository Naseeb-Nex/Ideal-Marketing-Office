import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';
import 'package:test2/wrapper/assigned_pgm_wrapper.dart';

import 'package:flutter/gestures.dart';

class Assignedpgmviewer extends StatelessWidget {
  Assignedpgmviewer({ Key? key }) : super(key: key);
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 15,
                color: secondbg.withOpacity(0.20),
              ),
            ],
            color: primarybg),
        child: ScrollConfiguration(
            behavior: Assignedpgmscroll(),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Assignedpgmwrapper(),
            )),
      ),
    ));
  }
}

class Assignedpgmscroll extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
