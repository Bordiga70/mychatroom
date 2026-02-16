import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user_model.dart';

class DatabaseHelper {
  static Future<Database> init() async {
    String path = join(await getDatabasesPath(), 'local.db');

    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  static Future<void> _createTable(Database db, int version) async {
    return await db.execute('''
    CREATE TABLE user (
      id INTEGER NOT NULL PRIMARY KEY,
      usr TEXT NOT NULL,
      email TEXT NOT NULL,
      pwd TEXT NOT NULL
    );
    ''');
  }

  static Future<void> addCredentials(Database db, UserModel user) async {
    db.insert('user', user.toMap());
  }

  static Future<UserModel?> getCredentials(Database db) async {
    final List<Map<String, dynamic>> result = await db.query('user');

    if (result.isEmpty) {
      return null;
    }

    return UserModel.fromMap(result.first);
  }
}
