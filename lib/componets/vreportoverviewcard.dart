import 'package:flutter/material.dart';
import 'package:test2/componets/loadingDialog.dart';
import 'package:test2/constants/constants.dart';
import 'package:iconsax/iconsax.dart';
// package
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';

// ignore: must_be_immutable
class Vreportoverviewcard extends StatefulWidget {
  String? name;
  String? username;
  String? vdocname;
  String? start;
  String? end;
  String? desc;
  String? docname;
  String? update;
  String? uptime;

  Vreportoverviewcard({
    Key? key,
    this.name,
    this.username,
    this.vdocname,
    this.docname,
    this.start,
    this.end,
    this.desc,
    this.update,
    this.uptime,
  }) : super(key: key);

  @override
  State<Vreportoverviewcard> createState() => _VreportoverviewcardState();
}

class _VreportoverviewcardState extends State<Vreportoverviewcard> {
  int dis = 0;
  @override
  void initState() {
    super.initState();

    if (widget.start != null && widget.end != null) {
      dis = int.parse("${widget.end}") - int.parse("${widget.start}");
    }
  }

  @override
  Widget build(context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 3),
            spreadRadius: 2,
            blurRadius: 3,
            color: secondbg.withOpacity(0.12),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(s.height * 0.03),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: s.height * 0.07,
                      height: s.height * 0.07,
                      child: Image.asset("assets/icons/scooter-1.png"),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: s.height * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Text(
                                "${widget.name}",
                                style: const  TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${widget.uptime}",
                          style:  const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                        Text(
                          "${widget.update}",
                          style: const  TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                 const SizedBox(
                  height: 10,
                ),
                Center(
                  child: widget.end == null
                      ? Padding(
                          padding: const  EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () => showDialog(
                                    context: context,
                                    builder: (context) => VehicleinfoDialog(
                                          docname: widget.docname,
                                          username: widget.username,
                                        )),
                                child: Container(
                                  padding: EdgeInsets.all(s.height * 0.03),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: bluebg,
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                        color: black.withOpacity(.05),
                                        offset: const  Offset(1, 1),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                         const Icon(
                                          Iconsax.add,
                                          color: white,
                                          size: 20,
                                        ),
                                         const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Add Usage",
                                          style: TextStyle(
                                            color: Colors.blueGrey.shade50,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : null,
                ),
                Center(
                  child: widget.end != null
                      ? Padding(
                          padding:
                              const  EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  color: black.withOpacity(.1),
                                  offset: Offset(1, 2),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: s.height * 0.02, vertical: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const  Center(
                                    child: Text(
                                      "Usage Details",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const  Text(
                                        "Distance Covered : ",
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        "$dis",
                                        style: const  TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      const  Text(
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
                                          const  SizedBox(height: 3),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: greenbg),
                                            padding: const  EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: Text(
                                              "${widget.start}",
                                              style:  const TextStyle(
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
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              gradient:  const LinearGradient(colors: [
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
                                          const  SizedBox(height: 3),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: redbg),
                                            padding:  const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: Text(
                                              "${widget.end}",
                                              style:  const TextStyle(
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
                                   const SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                   const     Text(
                                            "Discription : ",
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontSize: 15,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          Expanded(child: 
                                          Text("${widget.desc}",
                                        style: const  TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                        ),))
                                    ],
                                  ),
                                ]),
                          ),
                        )
                      : null,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class VehicleinfoDialog extends StatefulWidget {
  String? username;
  String? docname;

  VehicleinfoDialog({Key? key, 
    this.username,
    this.docname,
  }) : super(key: key);

  @override
  State<VehicleinfoDialog> createState() => _VehicleinfoDialogState();
}

class _VehicleinfoDialogState extends State<VehicleinfoDialog> {
  // Form Key
  // ignore: non_constant_identifier_names
  final form_key = GlobalKey<FormState>();

  // Text editor controller
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Dialog(
      insetAnimationCurve: Curves.easeInCubic,
      insetAnimationDuration:  const Duration(milliseconds: 300),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: s.height * 0.03,
          vertical: s.height * 0.03,
        ),
        child: Form(
          key: form_key,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  const [
                    Text(
                      "Vehicle Usage Info",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                 const Text(
                  "Starting KM",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                TextFormField(
                  autofocus: false,
                  controller: startController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Starting KM");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    startController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    suffixIcon: const  Icon(Icons.stacked_line_chart),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Starting Km",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style:  const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                const  Text(
                  "Closing KM",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                TextFormField(
                  autofocus: false,
                  controller: endController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Closing KM");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    endController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    suffixIcon:  const Icon(Icons.stacked_line_chart),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Closing Km",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style:  const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                 const Text(
                  "Description",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                TextFormField(
                  autofocus: false,
                  minLines: 3,
                  maxLines: 4,
                  controller: descController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please fill Description");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    descController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style:  const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: s.height * 0.01),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const  Color(0XFFeef1f7)),
                              child:  const Center(
                                  child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Color(0XFFa4a6aa),
                                  fontSize: 15,
                                ),
                              ))),
                        ),
                      ),
                       const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () => vehicle_usage(context),
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: s.height * 0.01),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bluebg),
                              child:  const Center(
                                  child: Text(
                                "Add",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: white,
                                  fontSize: 15,
                                ),
                              ))),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> vehicle_usage(BuildContext context) async {
    FirebaseFirestore fb = FirebaseFirestore.instance;

    DateTime now = DateTime.now();
    // Report
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);
    if (form_key.currentState!.validate()) {
      showDialog(context: context, builder: (context) => LoadingDialog());

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
          .doc(widget.docname)
          .update(
        {
          'start': startController.text,
          'end': endController.text,
          'desc': descController.text,
        },
      ).then((value) {
        Navigator.of(context).pop();
        Navigator.pop(context);
        MotionToast.success(
          title:  const Text(
            "Vehicle Usage Updated",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          description: const  Text(
            "Updated successfully",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          ),
        ).show(context);
      });
    }
  }
}

// ignore: must_be_immutable
class EditVehicleusage extends StatefulWidget {
  String? username;
  String? docname;
  String? start;
  String? end;
  String? desc;

  EditVehicleusage({Key? key, 
    this.username,
    this.docname,
    this.start,
    this.end,
    this.desc,
  }) : super(key: key);

  @override
  State<EditVehicleusage> createState() => _EditVehicleusageState();
}

class _EditVehicleusageState extends State<EditVehicleusage> {
  // Form Key
  // ignore: non_constant_identifier_names
  final form_key = GlobalKey<FormState>();

  // Text editor controller
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startController.text = "${widget.start}";
    endController.text = "${widget.end}";
    
    descController.text = "${widget.desc}";
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Dialog(
      insetAnimationCurve: Curves.easeInCubic,
      insetAnimationDuration:  const Duration(milliseconds: 300),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: s.height * 0.03,
          vertical: s.height * 0.03,
        ),
        child: Form(
          key: form_key,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  const [
                    Text(
                      "Edit Vehicle Usage Info",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                 const Text(
                  "Starting KM",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                TextFormField(
                  autofocus: false,
                  controller: startController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Starting KM");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    startController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    suffixIcon:  const Icon(Icons.stacked_line_chart),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Starting Km",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style:  const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                const  Text(
                  "Closing KM",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                TextFormField(
                  autofocus: false,
                  controller: endController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Closing KM");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    endController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    suffixIcon:  const Icon(Icons.stacked_line_chart),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Closing Km",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style:  const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                const  Text(
                  "Description",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                TextFormField(
                  autofocus: false,
                  minLines: 3,
                  maxLines: 4,
                  controller: descController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please fill Description");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    descController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style:  const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                Padding(
                  padding: const  EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: s.height * 0.01),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:  const Color(0XFFeef1f7)),
                              child:  const Center(
                                  child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Color(0XFFa4a6aa),
                                  fontSize: 15,
                                ),
                              ))),
                        ),
                      ),
                       const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () => vehicle_usage(context),
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: s.height * 0.01),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bluebg),
                              child:  const Center(
                                  child: Text(
                                "Update",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: white,
                                  fontSize: 15,
                                ),
                              ))),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> vehicle_usage(BuildContext context) async {
    FirebaseFirestore fb = FirebaseFirestore.instance;

    DateTime now = DateTime.now();
    // Report
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);
    if (form_key.currentState!.validate()) {
      showDialog(context: context, builder: (context) =>  const LoadingDialog());

      // report Update
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
          .doc(widget.docname)
          .update(
        {
          'start': startController.text,
          'end': endController.text,
          'desc': descController.text,
        },
      ).then((value) {
        Navigator.of(context).pop();
        Navigator.pop(context);
        MotionToast.success(
          title: const  Text(
            "Vehicle Usage Updated",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          description: const  Text(
            "Updated successfully",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          ),
        ).show(context);
      });
    }
  }
}
