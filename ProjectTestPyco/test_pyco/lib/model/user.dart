class User {
  String name;
  String email;
  String address;
  String phone;
  String gender;
  String urlMedium;

  User(
      {this.name,
      this.email,
      this.address,
      this.gender,
      this.phone,
      this.urlMedium});

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['url'] = this.urlMedium;
    return data;
  }
  User.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    email = map['email'];
    address = map['address'];
    phone = map['phone'];
    gender = map['gender'];
    urlMedium = map['url'];
  }
}
