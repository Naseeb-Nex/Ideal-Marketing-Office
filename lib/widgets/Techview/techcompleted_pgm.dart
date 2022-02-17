import 'package:flutter/material.dart';
import 'package:test2/componets/completed_pgm_card.dart';
import 'package:test2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';

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
        SizedBox(height: 8,),
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
