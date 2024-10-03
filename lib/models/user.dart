class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? createdTime;
  String? updateAt;
  String? role;

  User({this.id,
    this.name,
    this.email,
    this.password,
    this.createdTime,
    this.updateAt,
    this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    createdTime = json['createdTime'];
    updateAt = json['updateAt'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['createdTime'] = createdTime;
    data['updateAt'] = updateAt;
    data['role'] = role;
    return data;
  }
}