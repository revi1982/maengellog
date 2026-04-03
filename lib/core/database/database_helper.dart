import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;
  DatabaseHelper._internal();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'maengellog.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE entries (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        description TEXT,
        photo_path TEXT,
        category TEXT,
        location TEXT,
        latitude REAL,
        longitude REAL,
        witnesses TEXT,
        notes TEXT,
        entry_timestamp TEXT,
        created_at TEXT NOT NULL DEFAULT (datetime('now')),
        updated_at TEXT NOT NULL DEFAULT (datetime('now'))
      )
    ''');

    await db.execute('''
      CREATE TABLE settings (
        key TEXT PRIMARY KEY,
        value TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertEntry(Map<String, dynamic> data) async {
    final db  = await database;
    final now = DateTime.now().toIso8601String();
    return await db.insert('entries', {...data, 'created_at': now, 'updated_at': now});
  }

  Future<List<Map<String, dynamic>>> getAllEntries() async {
    final db = await database;
    return await db.query('entries', orderBy: 'created_at DESC');
  }

  Future<int> getEntryCount() async {
    final db     = await database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM entries');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> getEntryCountSince(DateTime since) async {
    final db = await database;
    final r  = await db.rawQuery(
      'SELECT COUNT(*) FROM entries WHERE created_at > ?',
      [since.toIso8601String()],
    );
    return Sqflite.firstIntValue(r) ?? 0;
  }

  Future<Map<String, dynamic>?> getLastEntry() async {
    final db      = await database;
    final results = await db.query('entries', orderBy: 'created_at DESC', limit: 1);
    return results.isNotEmpty ? results.first : null;
  }

  Future<int> updateEntry(int id, Map<String, dynamic> data) async {
    final db = await database;
    return await db.update(
      'entries',
      {...data, 'updated_at': DateTime.now().toIso8601String()},
      where: 'id = ?', whereArgs: [id],
    );
  }

  Future<int> deleteEntry(int id) async {
    final db = await database;
    return await db.delete('entries', where: 'id = ?', whereArgs: [id]);
  }

  Future<String?> getSetting(String key) async {
    final db   = await database;
    final rows = await db.query('settings', where: 'key = ?', whereArgs: [key]);
    return rows.isNotEmpty ? rows.first['value'] as String : null;
  }

  Future<void> setSetting(String key, String value) async {
    final db = await database;
    await db.insert(
      'settings', {'key': key, 'value': value},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
