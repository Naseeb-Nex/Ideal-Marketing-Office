import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

// ignore: must_be_immutable
class VehicleGrage extends StatefulWidget {
  String? username;
  String? techname;

  VehicleGrage({Key? key, this.username, this.techname})
      : super(key: key);

  @override
  _VehicleGrageState createState() => _VehicleGrageState();
}

class _VehicleGrageState extends State<VehicleGrage> {



  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ScrollConfiguration(
              behavior: VerticalScrollgesture(),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class VerticalScrollgesture extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
