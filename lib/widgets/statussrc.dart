import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:test2/widgets/Techview/tech_history.dart';
import 'package:test2/widgets/Techview/techcompleted_pgm.dart';
import 'package:test2/widgets/Techview/techpending_pgm.dart';
import 'package:test2/widgets/Techview/techprocessing_pgm.dart';
import 'Techview/exporttech.dart';

// ignore: must_be_immutable
class Statussrc extends StatefulWidget {
  String? uid;
  String? username;
  String? techname;
  Statussrc({Key? key, this.uid, this.username, this.techname})
      : super(key: key);

  @override
  StatussrcState createState() => StatussrcState();
}

class StatussrcState extends State<Statussrc> {
  String _currentsw = "Assign";
    final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Status",
            style: TextStyle(
              fontFamily: "Nunito",
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          Container(
            height: 5,
            width: 36,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ScrollConfiguration(
              behavior: Horizontalswipe(),
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
                          _currentsw = 'Assign';
                        }),
                        child: Container(
                          height: 50,
                          width: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: _currentsw == "Assign" ? white : Colors.blue,
                            border: Border.all(color: Colors.blue),
                          ),
                          child: Text(
                            "Assigned Programs",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color:
                                  _currentsw == "Assign" ? Colors.blue : white,
                            ),
                          ),
                        ),
                      ),
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
                            color:
                                _currentsw == "Pending" ? white : Colors.blue,
                            border: Border.all(color: Colors.blue),
                          ),
                          child: Text(
                            "Pending Programs",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color:
                                  _currentsw == "Pending" ? Colors.blue : white,
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
                            color:
                                _currentsw == "Completed" ? white : Colors.blue,
                            border: Border.all(color: Colors.blue),
                          ),
                          child: Text(
                            "Completed Programs",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: _currentsw == "Completed"
                                  ? Colors.blue
                                  : white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () => setState(() {
                          _currentsw = 'pros';
                        }),
                        child: Container(
                          height: 50,
                          width: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: _currentsw == "pros" ? white : Colors.blue,
                            border: Border.all(color: Colors.blue),
                          ),
                          child: Text(
                            "Processing Programs",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: _currentsw == "pros" ? Colors.blue : white,
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
                            color:
                                _currentsw == "History" ? white : Colors.blue,
                            border: Border.all(color: Colors.blue),
                          ),
                          child: Text(
                            "History",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color:
                                  _currentsw == "History" ? Colors.blue : white,
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
          // Techview(currentsw: _currentsw, uid: widget.uid, username: widget.username, techname: widget.techname)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding:const  EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        offset:const  Offset(0, 5),
                        blurRadius: 15,
                        color: secondbg.withOpacity(0.20),
                      ),
                    ],
                    color: primarybg),
                    child: Techview(currentsw: _currentsw, uid: widget.uid, username: widget.username, techname: widget.techname),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Horizontalswipe extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

// ignore: must_be_immutable
class Techview extends StatelessWidget {
  String? currentsw;
  String? uid;
  String? username;
  String? techname;
  Techview({Key? key, this.currentsw, this.uid, this.username, this.techname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currentsw == 'Pending') {
      return Techpending(uid: uid, username: username, techname: techname);
    } else if (currentsw == 'pros') {
      return Techprocessing(uid: uid, username: username, techname: techname);
    } else if (currentsw == 'Completed') {
      return Techcompleted(uid: uid, username: username, techname: techname);
    } else if (currentsw == 'History') {
      return Techhistoryview(uid: uid, username: username, techname: techname);
    }
    return Techasign(uid: uid, username: username, techname: techname);
  }
}
