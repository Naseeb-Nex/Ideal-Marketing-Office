import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test2/componets/loadingDialog.dart';
import 'package:test2/constants/constants.dart';
// import 'package:test2/services/techvehicle.dart';
// date
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:test2/services/techvehicle.dart';
import 'package:test2/services/vehicleusagehistory.dart';

// ignore: must_be_immutable
class Assignvehiclecard extends StatefulWidget {
  String? name;
  String? desc;
  String? type;
  String? status;
  String? statusdesc;
  String? techname;
  String? docname;
  String? username;
  String? update;
  String? uptime;

  Assignvehiclecard({
    Key? key,
    this.name,
    this.desc,
    this.type,
    this.status,
    this.statusdesc,
    this.techname,
    this.docname,
    this.username,
    this.update,
    this.uptime,
  }) : super(key: key);

  @override
  State<Assignvehiclecard> createState() => _AssignvehiclecardState();
}

class _AssignvehiclecardState extends State<Assignvehiclecard> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  bool isviz = false;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) => Dialog(
                  insetPadding: EdgeInsets.symmetric(horizontal: s.width * 0.3),
                  child: Padding(
                    padding: EdgeInsets.all(s.height * 0.01),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Center(
                              child: Image.asset(
                                "assets/images/delivery.jpg",
                                width: s.height * 0.2,
                                height: s.height * 0.2,
                              ),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Do you really want to Assign',
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 15,
                                color: Color(0XFF676767),
                                fontWeight: FontWeight.w400,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' ${widget.name}',
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0XFF676767),
                                  ),
                                ),
                                const TextSpan(
                                  text: ' to ',
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    color: Color(0XFF676767),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: '${widget.techname} ?',
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0XFF676767),
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: s.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                width: s.width * 0.1,
                                height: s.height * 0.05,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0XFFE7E7E7),
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                  color: white,
                                ),
                                child: const Center(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0XFF323233),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => assignvehicle(context),
                              child: Container(
                                width: s.width * 0.1,
                                height: s.height * 0.05,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0XFFE7E7E7),
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                  color: const Color(0XFFF2F3F3),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Okay",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0XFF323233),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: s.height * 0.03,
                        ),
                      ],
                    ),
                  ),
                ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 20,
              color: secondbg.withOpacity(0.23),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(s.width * 0.0095),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: s.width * 0.05,
                height: s.width * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: vybg),
                clipBehavior: Clip.hardEdge,
                child: Vehicleimagewrapper(widget.type),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: s.width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.name}",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${widget.desc}",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // upload asssigned details
  Future<void> assignvehicle(BuildContext context) async {
    DateTime now = DateTime.now();
    String update = DateFormat('d MM y').format(now);
    String uptime = DateFormat('h:mma').format(now);

    // Report
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);
    String techvdoc = DateFormat('MM d').format(now);
    String docName = DateFormat('kk:mm:ss').format(now);
    String usagedocname = DateFormat('MM d y kk:mm:ss').format(now);

    Techvehicle techv = Techvehicle(
      name: widget.name,
      upDate: update,
      upTime: uptime,
      username: widget.username,
      vdocname: widget.docname,
      docname: docName,
      type: widget.type,
      techname: widget.techname,
    );

    // Vehicle Usage history detials
    VehicleUsageHistory vusage = VehicleUsageHistory(
      name: widget.name,
      upDate: update,
      upTime: uptime,
      username: widget.username,
      docname: usagedocname,
      techname: widget.techname,
      type: widget.type,
      status: "Assigned"
    );

    showDialog(context: context, builder: (context)=> const LoadingDialog());

    // Profile vehicle updated
    await fb
        .collection("Technician")
        .doc(widget.username)
        .collection("Vehicle")
        .doc(techvdoc)
        .set(techv.toMap())
        .then((v) => print("profile updated"));

    // report added
    await fb
        .collection("Reports")
        .doc(year)
        .collection("Month")
        .doc(month)
        .collection(day)
        .doc("Tech")
        .collection("Reports")
        .doc("${widget.username}")
        .collection("vehicle")
        .doc(docName)
        .set(techv.toMap());

    // status change
    await fb.collection("Garage").doc(widget.docname).set({
      "status": "Ongoing",
      "techname": widget.techname,
      "username": widget.username
    }, SetOptions(merge: true));

    // history added
    await fb
        .collection("GarageUsage")
        .doc(usagedocname)
        .set(vusage.toMap())
        .then((v) => print("Vehicle assigned history added"));

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    // ignore: use_build_context_synchronously
    MotionToast.success(
      title: Text(
        "Vehicle assigned to ${widget.techname}",
        style: const TextStyle(
          fontFamily: "Montserrat",
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      description: const Text(
        "Successfully vehicle assigned",
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
    ).show(context);
  }
}

// ignore: must_be_immutable
class Vehicleimagewrapper extends StatelessWidget {
  String? type;
  Vehicleimagewrapper(this.type, {Key? key}) : super(key: key);

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
