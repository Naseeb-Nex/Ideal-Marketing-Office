class Pgmhistory {
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? pgm;
  String? chrg;
  String? type;
  String? upDate;
  String? upTime;
  String? docname;
  String? prospec;
  String? instadate;
  String? status;
  String? remarks;
  String? collection;
  String? techname;
  String? ch;

  Pgmhistory(
      {
      this.name,
      this.address,
      this.loc,
      this.phn,
      this.pgm,
      this.chrg,
      this.type,
      this.upDate,
      this.upTime,
      this.docname,
      this.prospec,
      this.instadate,
      this.status,
      this.remarks,
      this.collection,
      this.techname,
      this.ch,
      });

  // receiving data from server
  factory Pgmhistory.fromMap(map) {
    return Pgmhistory(
      name: map['name'],
      address: map['address'],
      loc: map['loc'],
      phn: map['phn'],
      pgm: map['pgm'],
      chrg: map['chrg'],
      type: map['type'],
      upDate: map['upDate'],
      upTime: map['upTime'],
      docname: map['docname'],
      prospec: map['prospec'],
      instadate: map['instadate'],
      status: map['status'],
      remarks: map['remarks'],
      collection: map['collection'],
      techname: map['techname'],
      ch: map['ch'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'loc': loc,
      'phn': phn,
      'pgm': pgm,
      'chrg': chrg,
      'type': type,
      'upDate': upDate,
      'upTime': upTime,
      'docname': docname,
      'prospec': prospec,
      'instadate': instadate,
      'status': status,
      'remarks': remarks,
      'collection': collection,
      'techname': techname,
      'ch': ch,
    };
  }
}
