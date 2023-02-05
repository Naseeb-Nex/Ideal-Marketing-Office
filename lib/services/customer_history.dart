class CustomerPgmHistory {
  String? upDate;
  String? upTime;
  String? docname;
  String? custdocname ;
  String? status;
  String? msg;
  String? techname;
  String? camount;
  String? remarks;

  CustomerPgmHistory(
      {
      this.techname,
      this.msg,
      this.camount,
      this.remarks,
      this.upDate,
      this.upTime,
      this.docname,
      this.custdocname,
      this.status,
      });

  // receiving data from server
  factory CustomerPgmHistory.fromMap(map) {
    return CustomerPgmHistory(
      techname: map['techname'],
      msg: map['msg'],
      camount: map['camount'],
      remarks: map['remarks'],
      upDate: map['upDate'],
      upTime: map['upTime'],
      docname: map['docname'],
      custdocname: map['custdocname'],
      status: map['status'],
    );  
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'techname': techname,
      'msg': msg,
      'camount': camount,
      'remarks': remarks,
      'upDate': upDate,
      'upTime': upTime,
      'docname': docname,
      'custdocname': custdocname,
      'status': status,
    };
  }
}
