import 'package:projcte_flutter/Screen/controll/model/question.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'quiz.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE questions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        answer1 TEXT,
        answer2 TEXT,
        answer3 TEXT,
        answer4 TEXT,
        correct TEXT
      )
    ''');
  }

  Future<void> setQuestion(Question question) async {
    final db = await database;
    await db.insert('questions', question.toMap());
  }

  Future<List<Question>> getQuestions() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('questions');
    return List.generate(maps.length, (index) => Question.fromMap(maps[index]));
  }

  Future<void> deleteQuestion(int id) async {
    final db = await database;
    await db.delete('questions', where: 'id = ?', whereArgs: [id]);
  }
}
