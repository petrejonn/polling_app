class User {
  String userName;
  String phone;

  User({this.userName, this.phone});

  User.fromMap(Map snapshot, String phone)
      : phone = phone ?? '',
        userName = snapshot['username'] ?? '';

  toJson() {
    return {'phone': phone, 'username': userName};
  }
}
