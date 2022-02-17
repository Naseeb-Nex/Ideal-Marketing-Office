import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';

import 'package:test2/widgets/Techview/techcompleted/techcday.dart';
import 'package:test2/widgets/Techview/techcompleted/techcmonth.dart';
import 'package:test2/widgets/Techview/techcompleted/techcyear.dart';

class Techcompleted extends StatefulWidget {
  String? uid;
  String? username;
  String? techname;

  Techcompleted({Key? key, this.uid, this.username, this.techname})
      : super(key: key);

  @override
  _TechcompletedState createState() => _TechcompletedState();
}

class _TechcompletedState extends State<Techcompleted> {
  @override
  List _allpgm = [];
  String _currentsw = "day";
  

  Widget build(BuildContext context) {
    
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          width: double.infinity,
          child: ScrollConfiguration(
            behavior: Techcswipe(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      _currentsw = 'day';
                    }),
                    child: Container(
                      height: 50,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: _currentsw == "day" ? white : Color(0xff560bad),
                        border: Border.all(color: Color(0xff560bad)),
                      ),
                      child: Text(
                        "Day",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color:
                              _currentsw == "day" ? Color(0xff560bad) : white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      _currentsw = 'month';
                    }),
                    child: Container(
                      height: 50,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:
                            _currentsw == "month" ? white : Color(0xff560bad),
                        border: Border.all(color: Color(0xff560bad)),
                      ),
                      child: Text(
                        "Month",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color:
                              _currentsw == "month" ? Color(0xff560bad) : white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      _currentsw = 'year';
                    }),
                    child: Container(
                      height: 50,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: _currentsw == "year" ? white : Color(0xff560bad),
                        border: Border.all(color: Color(0xff560bad)),
                      ),
                      child: Text(
                        "Year",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color:
                              _currentsw == "year" ? Color(0xff560bad) : white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Ctechwrapper(
                  currentsw: _currentsw,
                  uid: widget.uid,
                  username: widget.username,
                  techname: widget.techname),
            ),
          ),
        ),
      ],
    );
  }
}

class Techcswipe extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class Ctechwrapper extends StatelessWidget {
  String? currentsw;
  String? uid;
  String? username;
  String? techname;
  Ctechwrapper(
      {Key? key, this.currentsw, this.uid, this.username, this.techname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currentsw == 'year')
      return Techcyear(uid: uid, username: username, techname: techname);
    else if (currentsw == 'month')
      return Techcmonth(uid: uid, username: username, techname: techname);
    return Techcday(uid: uid, username: username, techname: techname);
  }
}
