class UserModel {
  UserModel({
    required this.id,
    required this.usr,
    required this.email,
    required this.pwd,
  });

  final int? id;
  final String usr;
  final String email;
  final String pwd;

  Map<String, dynamic> toMap() {
    return {'id': id, 'usr': usr, 'email': email, 'pwd': pwd};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      usr: map['usr'],
      email: map['email'],
      pwd: map['pwd'],
    );
  }
}
