import 'package:flutter/material.dart';
import 'package:test2/constants/constants.dart';

class Viewpgmcard extends StatelessWidget {
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? type;
  String? pgm;
  String? upDate;
  String? upTime;
  String? docname;

  Viewpgmcard({
    Key? key,
    this.name,
    this.address,
    this.loc,
    this.phn,
    this.type,
    this.pgm,
    this.upDate,
    this.upTime,
    this.docname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 5,
              color: secondbg.withOpacity(0.18),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$name",
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "$address",
                  style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 16,
                      color: Colors.black26),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "$pgm",
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "$phn",
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 15,
                          color: Colors.black26),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "$upDate",
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  "$upTime",
                  style: const TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 15,
                  ),
                )
              ],
            )
            
            // first try

            //   Row(
            //     children: [
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Column(
            //         children: [
            //           Text(
            //             "$name",
            //             style: const TextStyle(
            //               fontFamily: "Nunito",
            //               fontSize: 25,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           Text(
            //             "$address",
            //             style: const TextStyle(
            //               fontFamily: "Nunito",
            //               fontSize: 18,
            //             ),
            //           ),
            //         ],
            //       ),
            //       Expanded(
            //         child: Center(
            //           child: Text(
            //             "$pgm",
            //             style: const TextStyle(
            //               fontFamily: "Nunito",
            //               fontSize: 22,
            //               fontWeight: FontWeight.w500,
            //               color: Color(0xFF666666),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Column(
            //         children: [
            //           Text(
            //             "$upDate",
            //             style: const TextStyle(
            //               fontFamily: "Nunito",
            //               fontSize: 17,
            //             ),
            //           ),
            //           Text(
            //             "$upTime",
            //             style:const TextStyle(
            //               fontFamily: "Nunito",
            //               fontSize: 17,
            //             ),
            //           ),
            //         ],
            //       )
            //     ],
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.only(top: 10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Row(
            //           children: [
            //             const Icon(
            //               Icons.pin_drop_outlined,
            //               color: cheryred,
            //             ),
            //             Text(
            //               "  $loc",
            //               style: const TextStyle(
            //                 fontFamily: "Nunito",
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //             const SizedBox(
            //               width: 50,
            //             ),
            //             Container(
            //               alignment: Alignment.centerRight,
            //               child: Text(
            //                 "Type : $type",
            //                 style: const TextStyle(
            //                   fontFamily: "Nunito",
            //                   fontSize: 20,
            //                   color: Color(0xFF0e2f44),
            //                 ),
            //               ),
            //             ),
            //             const SizedBox(
            //               width: 50,
            //             ),
            //             const Icon(
            //               Icons.phone_android,
            //               color: Color(0xFF008080),
            //             ),
            //             Text(
            //               "  $phn",
            //               style: const TextStyle(
            //                 fontFamily: "Nunito",
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.normal,
            //                 color: Color(0xFF008080),
            //               ),
            //             ),
            //           ],
            //         ),
            //         // Container(
            //         //   child: IconButton(
            //         //     icon: Icon(Icons.edit),
            //         //     color: Color(0xff660066),
            //         //     onPressed: () => print("Pressed"),
            //         //   ),
            //         // )
            //       ],
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
