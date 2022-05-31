import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';

import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';

import 'package:test2/widgets/all completed pgm list/completeddayview.dart';
import 'package:test2/widgets/all completed pgm list/completedmonthview.dart';

// ignore: must_be_immutable
class Completedpgmwrapper extends StatefulWidget {
  String? userid;
  Completedpgmwrapper({Key? key, this.userid}) : super(key: key);

  @override
  State<Completedpgmwrapper> createState() => _CompletedpgmwrapperState();
}

class _CompletedpgmwrapperState extends State<Completedpgmwrapper> {
  String _currentsw = "day";
  String? _selectedmonth;
  String year = "2022";

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    setState(() {
      _selectedmonth = DateFormat('MM y').format(now);
      year = DateFormat('y').format(now);
    });
  }

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> categorylist = [
      "01 $year",
      "02 $year",
      "03 $year",
      "04 $year",
      "05 $year",
      "06 $year",
      "07 $year",
      "08 $year",
      "09 $year",
      "10 $year",
      "11 $year",
      "12 $year",
    ];
    return categorylist
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final monthsel = InputDecorator(
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.date_range_rounded,
          color: white,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        hintText: "Month",
        border: InputBorder.none,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: _selectedmonth,
          items: _dropDownItem(),
          onChanged: (value) {
            setState(() {
              _selectedmonth = value as String?;
            });
          },
          hint: const Text(
            "Select Month",
            style: TextStyle(color: white, fontFamily: "Montserrat"),
          ),
          elevation: 12,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "Montserrat",
          ),
          icon: const Icon(
            Icons.arrow_drop_down_circle,
            color: white,
          ),
          iconDisabledColor: Colors.white60,
          iconEnabledColor: cheryred,
          isExpanded: true,
        ),
      ),
    );

    return Column(
      children: [
        const SizedBox(
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
                  const SizedBox(
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
                          color: _currentsw == "day" ? cheryred : white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
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
                        color: _currentsw == "month" ? white : cheryred,
                        border: Border.all(color: cheryred),
                      ),
                      child: Text(
                        "Month",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: _currentsw == "month" ? cheryred : white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Center(
                    child: _currentsw == "month"
                        ? Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: cheryred,
                            ),
                            child: monthsel,
                          )
                        : null,
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            // height: double.infinity,
            child: Completedveiwwrapper(
              currentsw: _currentsw,
              cmonth: _selectedmonth,
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

// ignore: must_be_immutable
class Completedveiwwrapper extends StatelessWidget {
  String? currentsw;
  String? cmonth;
  Completedveiwwrapper({Key? key, this.currentsw, this.cmonth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currentsw == 'month') {
      return Completedmonthview(cmonth: cmonth);
    }
    return Completeddayview();
  }
}
