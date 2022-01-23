class Assignpgmdata {
  String? uid;
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
  

  Assignpgmdata(
      {this.uid,
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
      this.priority,});

  // receiving data from server
  factory Assignpgmdata.fromMap(map) {
    return Assignpgmdata(
      uid: map['uid'],
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
    };
  }
}
