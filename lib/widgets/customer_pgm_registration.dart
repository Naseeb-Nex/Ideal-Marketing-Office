import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomerpgmReg extends StatefulWidget {
  final cust;
  CustomerpgmReg({Key? key, this.cust}) : super(key: key);

  @override
  _CustomerpgmRegState createState() => _CustomerpgmRegState();
}

class _CustomerpgmRegState extends State<CustomerpgmReg> {
  final _formkey = GlobalKey<FormState>();


  TextEditingController namecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController loccontroller = TextEditingController();
  TextEditingController prospeccontroller = TextEditingController();
  TextEditingController instadatecontroller = TextEditingController();
  TextEditingController phn1controller = TextEditingController();
  TextEditingController pgmcontroller = TextEditingController();
  TextEditingController chrgcontroller = TextEditingController();

  String? _selectedcategory;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      namecontroller.text = widget.cust.name;
      addresscontroller.text = widget.cust.address;
      loccontroller.text = widget.cust.loc;
      prospeccontroller.text = widget.cust.prospec;
      instadatecontroller.text = widget.cust.instadate;
      phn1controller.text = widget.cust.phn1;
    });
  }

  
  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> categorylist = [
      "Follow Up Service",
      "Collection",
      "Installation",
      "Service",
      "Other"
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

    Size s = MediaQuery.of(context).size;

    final categoryselector = InputDecorator(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mode_edit_outlined),
        contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        hintText: "Category",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child:  DropdownButtonHideUnderline(
        child:  DropdownButton(
          value: _selectedcategory,
          items: _dropDownItem(),
          onChanged: (value) {
            setState(() {
              _selectedcategory = value as String?;
            });
          },
          hint: const Text("Select service type"),
          elevation: 12,
          style: const TextStyle(color: Colors.grey, fontSize: 16),
          icon: const Icon(Icons.arrow_drop_down_circle),
          iconDisabledColor: Colors.grey,
          iconEnabledColor: const Color(0xFF3469F2),
          isExpanded: true,
        ),
      ),
    );

    return SizedBox(
      width: double.infinity,
      height: s.height - 100,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Program Registration",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: s.width * 0.05),
                child: Wrap(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 5.0, bottom: 5.0, right: s.width * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Full Name",
                                  style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  autofocus: false,
                                  controller: namecontroller,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0XFFD8D8D8),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 5.0, bottom: 5.0, left: s.width * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Address",
                                  style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  autofocus: false,
                                  controller: addresscontroller,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0XFFD8D8D8),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Center(
                          child: _loading
                              ? const CircularProgressIndicator(
                                  color: bluebg,
                                )
                              : null,
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 5.0, bottom: 5.0, right: s.width * 0.05),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Location",
                                      style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextField(
                                      autofocus: false,
                                      controller: loccontroller,
                                      enabled: false,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: const Color(0XFFD8D8D8),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 5.0, bottom: 5.0, left: s.width * 0.05),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Product Specification",
                                      style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextField(
                                      autofocus: false,
                                      controller: prospeccontroller,
                                      enabled: false,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: const Color(0XFFD8D8D8),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 5.0, bottom: 5.0, right: s.width * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Installation Date",
                                  style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  autofocus: false,
                                  controller: instadatecontroller,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0XFFD8D8D8),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 5.0, bottom: 5.0, left: s.width * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Phone Number 1",
                                  style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  autofocus: false,
                                  controller: phn1controller,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0XFFD8D8D8),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Program",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      autofocus: false,
                      maxLines: 7,
                      minLines: 4,
                      controller: pgmcontroller,
                      textInputAction: TextInputAction.next,
                      onSaved: (value) {
                        pgmcontroller.text = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please enter the Program");
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Padding(
                             padding: EdgeInsets.only(
                                top: 5.0, bottom: 5.0, right: s.width * 0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Collection Amount",
                                    style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    autofocus: false,
                                    controller: chrgcontroller,
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) {
                                      chrgcontroller.text = value!;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please enter the Amount");
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 5.0, bottom: 5.0, left: s.width * 0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Category",
                                    style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  categoryselector
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: s.width * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF1FE31B)),
                    child: const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 40,
                    width: s.width * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFFF0000),
                        ),
                    child: const Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
