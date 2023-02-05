class Customer {
  String? name;
  String? address;
  String? loc;
  String? phn1;
  String? phn2;
  String? upDate;
  String? upTime;
  String? docname;
  String? prospec ;
  String? instadate;

  Customer(
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

  // receiving data from server
  factory Customer.fromMap(map) {
    return Customer(
      name: map['name'],
      address: map['address'],
      loc: map['loc'],
      phn1: map['phn1'],
      phn2: map['phn2'],
      upDate: map['upDate'],
      upTime: map['upTime'],
      docname: map['docname'],
      prospec: map['prospec'],
      instadate: map['instadate'],
    );  
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'loc': loc,
      'phn1': phn1,
      'phn2': phn2,
      'upDate': upDate,
      'upTime': upTime,
      'docname': docname,
      'prospec': prospec,
      'instadate': instadate,
    };
  }
}
