import 'package:bcrypt/bcrypt.dart';

class Hashing {
  String hash(String pwd) {
    return BCrypt.hashpw(pwd, BCrypt.gensalt());
  }

  bool check(String pwd, String hashed) {
    return BCrypt.checkpw(pwd, hashed);
  }
}
