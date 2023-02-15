class VehicleUsageHistory {
  String? name;
  String? start;
  String? end;
  String? username;
  String? docname;
  String? upDate;
  String? upTime;
  String? desc;
  String? techname;
  String? type;
  String? status;


  VehicleUsageHistory({
    this.name,
    this.start,
    this.end,
    this.username,
    this.docname,
    this.upDate,
    this.upTime,
    this.desc,
    this.techname,
    this.type,
    this.status,
  });

  // receiving data from server
  factory VehicleUsageHistory.fromMap(map) {
    return VehicleUsageHistory(
      name: map['name'],
      start: map['start'],
      end: map['end'],
      docname: map['docname'],
      upDate: map['upDate'],
      upTime: map['upTime'],
      username: map['username'],
      desc: map['desc'],
      techname: map['techname'],
      type: map['type'],
      status: map['status'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'start': start,
      'name': name,
      'end': end,
      'upDate': upDate,
      'upTime': upTime,
      'docname': docname,
      'username': username,
      'desc': desc,
      'techname': techname,
      'type': type,
      'status': status,
    };
  }
}
