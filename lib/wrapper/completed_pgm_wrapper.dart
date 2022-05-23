import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:test2/constants/constants.dart';

class Completedpgmwrapper extends StatefulWidget {
  String? userid;
  Completedpgmwrapper({Key? key, this.userid}) : super(key: key);

  @override
  State<Completedpgmwrapper> createState() => _CompletedpgmwrapperState();
}

class _CompletedpgmwrapperState extends State<Completedpgmwrapper> {
      String _currentsw = "day";

  @override
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
                        color: _currentsw == "day" ? white : cheryred,
                        border: Border.all(color: cheryred),
                      ),
                      child: Text(
                        "Day",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color:
                              _currentsw == "day" ? cheryred : white,
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
                            _currentsw == "month" ? white : cheryred,
                        border: Border.all(color: cheryred),
                      ),
                      child: Text(
                        "Month",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color:
                              _currentsw == "month" ? cheryred : white,
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
                        color: _currentsw == "year" ? white : cheryred,
                        border: Border.all(color: cheryred),
                      ),
                      child: Text(
                        "Year",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color:
                              _currentsw == "year" ? cheryred : white,
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