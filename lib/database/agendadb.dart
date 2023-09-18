import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:project1/models/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Agenda {
  static final db_name = 'Agendadb';
  static final versiondb = 1;

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    return _database = await _initDatabase();
  }

  Future<Database?> _initDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String pathdb = join(dir.path, db_name);
    return openDatabase(pathdb, version: versiondb, onCreate: _createTables);
  }

  FutureOr<void> _createTables(Database db, int version) {
    String query = '''create table tasks(task_id integer primary key,
    task_name varchar(50), task_desc varchar(50),task_state byte)''';
    db.execute(query);
  }

  Future<int> INSERT(String tName, Map<String, dynamic> data) async {
    var connection = await database;
    return connection!.insert(tName, data);
  }

  Future<int> UPDATE(String tName, Map<String, dynamic> data) async {
    var connection = await database;
    return connection!.update(tName, data,
        where: 'task_id = ?', whereArgs: [data['task_id']]);
  }

  Future<int> DELETE(String tName, int task_id) async {
    var connection = await database;
    return connection!
        .delete(tName, where: 'task_id = ?', whereArgs: [task_id]);
  }

  Future<List<TaskModel>> GETALLTASKS() async {
    var connection = await database;
    var result = await connection!.query('tasks');
    return result.map((task) => TaskModel.fromMap(task)).toList();
  }
}

//MAPA ES EQUIVALENTE A JSON