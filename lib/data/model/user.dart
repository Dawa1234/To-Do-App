class User {
  String? username;
  String? password;
  String? uid;

  User({this.username, this.password, this.uid});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'uid': uid,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      uid: json['uid'],
    );
  }
}
