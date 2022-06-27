class Pgmdata {
  String? uid;
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? phn2;
  String? pgm;
  String? chrg;
  String? type;
  String? upDate;
  String? upTime;
  String? docname;
  String? prospec;
  String? instadate;
  String? status;
  String? custdocname;

  Pgmdata(
      {this.uid,
      this.name,
      this.address,
      this.loc,
      this.phn,
      this.phn2,
      this.pgm,
      this.chrg,
      this.type,
      this.upDate,
      this.upTime,
      this.docname,
      this.prospec,
      this.instadate,
      this.status,
      this.custdocname,});

  // receiving data from server
  factory Pgmdata.fromMap(map) {
    return Pgmdata(
      uid: map['uid'],
      name: map['name'],
      address: map['address'],
      loc: map['loc'],
      phn: map['phn'],
      phn2: map['phn2'],
      pgm: map['pgm'],
      chrg: map['chrg'],
      type: map['type'],
      upDate: map['upDate'],
      upTime: map['upTime'],
      docname: map['docname'],
      prospec: map['prospec'],
      instadate: map['instadate'],
      status: map['status'],
      custdocname: map['custdocname'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'address': address,
      'loc': loc,
      'phn': phn,
      'phn2': phn2,
      'pgm': pgm,
      'chrg': chrg,
      'type': type,
      'upDate': upDate,
      'upTime': upTime,
      'docname': docname,
      'prospec': prospec,
      'instadate': instadate,
      'status': status,
      'custdocname': custdocname,
    };
  }
}
