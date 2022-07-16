import 'package:flutter/gestures.dart';
import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:test2/widgets/export_widget.dart';
import 'package:test2/widgets/history_pgm_viewer.dart';

class Pgmviewer extends StatefulWidget {
  const Pgmviewer({Key? key}) : super(key: key);

  @override
  _PgmviewerState createState() => _PgmviewerState();
}

class _PgmviewerState extends State<Pgmviewer> {
  String _currentsw = "Pending";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Viewer",
          style: TextStyle(
            fontFamily: "Nunito",
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black38,
          ),
        ),
        Container(
          height: 5,
          width: 36,
          decoration: BoxDecoration(
              color: Colors.black26, borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        _currentsw = 'Pending';
                      }),
                      child: Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: _currentsw == "Pending" ? white : cheryred,
                          border: Border.all(color: cheryred),
                        ),
                        child: Text(
                          "Pending Programs",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: _currentsw == "Pending" ? cheryred : white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        _currentsw = 'Assign';
                      }),
                      child: Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: _currentsw == "Assign" ? white : cheryred,
                          border: Border.all(color: cheryred),
                        ),
                        child: Text(
                          "Assigned Programs",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: _currentsw == "Assign" ? cheryred : white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        _currentsw = 'Completed';
                      }),
                      child: Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: _currentsw == "Completed" ? white : cheryred,
                          border: Border.all(color: cheryred),
                        ),
                        child: Text(
                          "Completed Programs",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: _currentsw == "Completed" ? cheryred : white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        _currentsw = 'History';
                      }),
                      child: Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: _currentsw == "History" ? white : cheryred,
                          border: Border.all(color: cheryred),
                        ),
                        child: Text(
                          "History",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: _currentsw == "History" ? cheryred : white,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ViewerWrapper(currentsw: _currentsw)
      ],
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

// ignore: must_be_immutable
class ViewerWrapper extends StatelessWidget {
  String? currentsw;
  ViewerWrapper({Key? key, this.currentsw}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currentsw == 'Assign') {
      return Assignedpgmviewer();
    } else if (currentsw == 'Completed') {
      return Completedpgmviewer();
    } else if (currentsw == 'History') {
      return const Historypgmviewer();
    }
    return const PendingPgmViewer();
  }
}
