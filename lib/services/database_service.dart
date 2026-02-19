import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/message_model.dart';
import '../models/user_model.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();

  factory DatabaseService() => _instance;

  DatabaseService._internal();

  late Database _db;

  Future<void> init() async {
    String path = join(await getDatabasesPath(), 'local.db');

    _db = await openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
    CREATE TABLE user (
      id INTEGER NOT NULL PRIMARY KEY,
      usr TEXT NOT NULL,
      email TEXT NOT NULL,
      pwd TEXT NOT NULL
    );
  ''');

    await db.execute('''
    CREATE TABLE message (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "from" INTEGER NOT NULL,
      "to" INTEGER NOT NULL,
      message TEXT NOT NULL,
      created_at TEXT NOT NULL
    );
  ''');
  }

  Future<void> addCredentials(UserModel user) async {
    _db.insert('user', user.toMap());
  }

  Future<List<UserModel>> getCredentials() async {
    final List<Map<String, dynamic>> result = await _db.query('user');

    if (result.isEmpty) {
      return <UserModel>[];
    }

    return result.map((row) => UserModel.fromMap(row)).toList();
  }

  Future<void> addMessage(MessageModel message) async {
    _db.insert('message', message.toMap());
  }

  Future<List<MessageModel>> getMessages() async {
    final List<Map<String, dynamic>> result = await _db.query('message');

    if (result.isEmpty) {
      return <MessageModel>[];
    }

    return result.map((row) => MessageModel.fromMap(row)).toList();
  }
}
