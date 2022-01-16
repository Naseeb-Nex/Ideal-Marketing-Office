class UserModel {
  String? uid;
  String? email;
  String? category;

  UserModel({this.uid, this.email, this.category});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'], email: map['email'], category: map['category']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'category': category,
    };
  }
}
