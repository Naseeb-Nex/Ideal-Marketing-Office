import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';

// ignore: must_be_immutable
class Vusagehistorycard extends StatefulWidget {
  String? name;
  String? start;
  String? end;
  String? username;
  String? docname;
  String? upDate;
  String? upTime;
  String? desc;
  String? techname;
  String? type;
  String? status;

  Vusagehistorycard({
    Key? key,
    this.name,
    this.start,
    this.end,
    this.username,
    this.docname,
    this.upDate,
    this.upTime,
    this.desc,
    this.techname,
    this.type,
    this.status,
  }) : super(key: key);

  @override
  State<Vusagehistorycard> createState() => _VusagehistorycardState();
}

class _VusagehistorycardState extends State<Vusagehistorycard> {
  int dis = 0;
  @override
  void initState() {
    super.initState();

    if (widget.start != null && widget.end != null) {
      dis = int.parse("${widget.end}") - int.parse("${widget.start}");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 10,
            color: secondbg.withOpacity(0.23),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(s.width * 0.007),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: s.width * 0.045,
                  height: s.width * 0.045,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), color: vybg),
                  clipBehavior: Clip.hardEdge,
                  child: Vehicleimagewrapper(widget.type),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: s.width * 0.009),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Text(
                                "${widget.name}",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            VStatuswrapper(status: widget.status),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bluebg.withOpacity(.8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icons/technician.png",
                                      color: white,
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${widget.techname}",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w600,
                                        color: white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${widget.upTime}",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.blueGrey.shade300),
                                ),
                                Text(
                                  "${widget.upDate}",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.blueGrey.shade300),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: widget.status == "Usage Report" ||
                      widget.status == "Usage Report (Edited)"
                  ? Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(),
                            Center(
                              child: Text(
                                "Usage Details",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Distance Covered : ",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  "$dis",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  " Km",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            SizedBox(height: s.height * 0.01),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                          "assets/icons/scooter_icon.png"),
                                    ),
                                    SizedBox(height: 3),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: greenbg),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Text(
                                        "${widget.start}",
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    height: 1,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        gradient: LinearGradient(colors: [
                                          Colors.green,
                                          Colors.orangeAccent,
                                          Colors.redAccent
                                        ])),
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                          "assets/icons/scooter_icon.png"),
                                    ),
                                    SizedBox(height: 3),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: redbg),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Text(
                                        "${widget.end}",
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                          color: redfg,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Vehicleimagewrapper extends StatelessWidget {
  String? type;
  Vehicleimagewrapper(this.type);

  @override
  Widget build(BuildContext context) {
    if (type == "Scooter") {
      return Image.asset(
        "assets/icons/scooter.jpg",
        fit: BoxFit.cover,
      );
    } else if (type == "Truck") {
      return Image.asset(
        "assets/icons/truck.png",
        fit: BoxFit.cover,
      );
    } else if (type == "Self Vehicle") {
      return Image.asset(
        "assets/icons/self_vehicle.jpg",
        fit: BoxFit.cover,
      );
    }
    return Image.asset(
      "assets/icons/bike.jpg",
      fit: BoxFit.cover,
    );
  }
}

// ignore: must_be_immutable
class VStatuswrapper extends StatelessWidget {
  String? status;
  VStatuswrapper({this.status});

  @override
  Widget build(BuildContext context) {
    // Assigned
    if (status == "Assigned") {
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: yellowbg,
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 1,
              color: black.withOpacity(.05),
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Text(
          "${status}",
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: yellowfg,
          ),
        ),
      );
    }
    // Assigned (Self)
    else if (status == "Assigned (Self)") {
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.yellow.shade50,
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 1,
              color: black.withOpacity(.05),
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Text(
          "$status",
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: yellowfg,
          ),
        ),
      );
    }
    // impound
    else if (status == "Impounded" || status == "Recall") {
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: redbg,
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 1,
              color: black.withOpacity(.05),
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Text(
          "${status}",
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: redfg,
          ),
        ),
      );
    }
    // Usage Report
    else if (status == "Usage Report") {
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: limegreen.withOpacity(0.05),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 1,
              color: black.withOpacity(.05),
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Text(
          "${status}",
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: limegreen,
          ),
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: greenbg,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 1,
            color: black.withOpacity(.05),
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Text(
        "${status}",
        style: const TextStyle(
          fontFamily: "Montserrat",
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.green,
        ),
      ),
    );
  }
}
