class UserData {
  String? username;
  String? password;
  String? uid;

  UserData({this.username, this.password, this.uid});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'uid': uid,
    };
  }

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      username: json['username'],
      password: json['password'],
      uid: json['uid'],
    );
  }
}
