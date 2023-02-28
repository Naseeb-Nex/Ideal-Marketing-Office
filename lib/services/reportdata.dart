class Reportdata {
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
  String? status;
  String? username;
  String? techname;
  String? assignedtime;
  String? assigneddate;
  String? priority;
  String? camount;
  String? remarks;
  String? ctime;
  String? cdate;
  String? ccollname;
  String? cdocname;
  String? custdocname;
  String? rpdocname;

  Reportdata({
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
    this.status,
    this.username,
    this.techname,
    this.assignedtime,
    this.assigneddate,
    this.priority,
    this.camount,
    this.remarks,
    this.cdate,
    this.ctime,
    this.ccollname,
    this.cdocname,
    this.custdocname,
    this.rpdocname,
  });

  // receiving data from server
  factory Reportdata.fromMap(map) {
    return Reportdata(
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
      status: map['status'],
      username: map['username'],
      techname: map['techname'],
      assignedtime: map['assignedtime'],
      assigneddate: map['assigneddate'],
      priority: map['priority'],
      camount: map['camount'],
      remarks: map['remarks'],
      cdate: map['cdate'],
      ctime: map['ctime'],
      ccollname: map['ccollname'],
      cdocname: map['cdocname'],
      custdocname: map['custdocname'],
      rpdocname: map['rpdocname'],
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
      'status': status,
      'username': username,
      'techname': techname,
      'assignedtime': assignedtime,
      'assigneddate': assigneddate,
      'priority': priority,
      'camount': camount,
      'remarks': remarks,
      'cdate': cdate,
      'ctime': ctime,
      'ccollname': ccollname,
      'cdocname': cdocname,
      'custdocname': custdocname,
      'rpdocname': rpdocname,
    };
  }
}
