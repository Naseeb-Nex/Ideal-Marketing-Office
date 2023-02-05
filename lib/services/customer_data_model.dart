import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerDataModel {
  String? name;
  String? address;
  String? loc;
  String? phn1;
  String? phn2;
  String? upDate;
  String? upTime;
  String? docname;
  String? prospec;
  String? instadate;

  CustomerDataModel(
      {
      this.name,
      this.address,
      this.loc,
      this.phn1,
      this.phn2,
      this.upDate,
      this.upTime,
      this.docname,
      this.prospec,
      this.instadate,
      });

      List<CustomerDataModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return CustomerDataModel(
          name: dataMap['name'],
          address: dataMap['address'],
          loc: dataMap['loc'],
          phn1: dataMap['phn1'],
          upDate: dataMap['upDate'],
          upTime: dataMap['upTime'],
          docname: dataMap['docname'],
          instadate: dataMap['instadate'],
          prospec: dataMap['prospec'],
          phn2: dataMap['phn2']);
    }).toList();
  }
}







//   // receiving data from server
//   factory CustomerDataModel.fromMap(map) {
//     return CustomerDataModel(
//       name: map['name'],
//       address: map['address'],
//       loc: map['loc'],
//       phn1: map['phn1'],
//       phn2: map['phn2'],
//       upDate: map['upDate'],
//       upTime: map['upTime'],
//       docname: map['docname'],
//       prospec: map['prospec'],
//       instadate: map['instadate'],
//     );
//   }

//   // sending data to our server
//   Map<String, dynamic> toMap() {
//     return {
      // 'name': name,
      // 'address': address,
      // 'loc': loc,
      // 'phn1': phn1,
      // 'phn2': phn2,
      // 'upDate': upDate,
      // 'upTime': upTime,
      // 'docname': docname,
      // 'prospec': prospec,
      // 'instadate': instadate,
//     };
//   }
// }
