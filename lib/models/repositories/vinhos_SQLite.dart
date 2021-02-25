import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/vinho.dart';
class VinhosSQLite{
  Database _database;
  Database get db{
    return _database;
  }
  Future<void> DBconstructor() async{
    _database = await openDatabase(
      join(await getDatabasesPath(), 'vinhos_database_1_0.db'),
      onCreate: (db, version) {
        return db.execute(
          """CREATE TABLE Vinhos (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                nome TEXT,
                pais TEXT,
                regiao TEXT,
                tipo TEXT,
                safra INTEGER,
                notaRP TEXT,
                notaWS TEXT,
                beberRP TEXT,
                quantidade INTEGER,
                etiqueta TEXT
            );""",
        );
      },
      version: 1,
    );
  }
  Future<void> insert(Vinho vinho) async {
    await _database.insert(
      'Vinhos',
      vinho.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Vinho>> getAll() async {
    final List<Map<String, dynamic>> maps = await _database.query('Vinhos');
    return List.generate(maps.length, (i) {
      return Vinho.fromJson(maps[i]);
    });
  }
  Future<void> update(Vinho vinho) async {
    await _database.update(
      'Vinhos',
      vinho.toJson(),
      where: "id = ?",
      whereArgs: [vinho.id],
    );
  }
  Future<void> delete(int id) async {
    await _database.delete(
      'Vinhos',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}