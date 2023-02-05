import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';
import 'package:test2/wrapper/pending_pgm_wrapper.dart';

import 'package:flutter/gestures.dart';

class PendingPgmViewer extends StatefulWidget {
  const PendingPgmViewer({Key? key}) : super(key: key);

  @override
  _PendingPgmViewerState createState() => _PendingPgmViewerState();
}

class _PendingPgmViewerState extends State<PendingPgmViewer> {
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
                offset: Offset(0, 5),
                blurRadius: 15,
                color: secondbg.withOpacity(0.20),
              ),
            ],
            color: primarybg),
        child: ScrollConfiguration(
            behavior: VerticalScroll(),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: PendingPgmWrapper(),
            )),
      ),
    ));
  }
}

class VerticalScroll extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
