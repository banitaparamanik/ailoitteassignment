import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  DataBaseHelper._();
  static final DataBaseHelper instance = DataBaseHelper._();
  factory DataBaseHelper() => instance;

  static late Database? _database;

  static String drinkTable = "DrinkTable";

  static Future<void> createDb() async {
    String dbPath = await getDatabasesPath();

    debugPrint(dbPath);
    _database = await openDatabase(
      "$dbPath/drink.db",
      version: 1,
      onCreate: (Database db, int versiom) async {
        await db.execute('''
            CREATE TABLE $drinkTable (
              Id INTEGER PRIMARY KEY AUTOINCREMENT,
              idDrink TEXT,
              isFavorite BOOLEAN,
              strAlcoholic TEXT,
              strCategory TEXT,
              strDrink TEXT ,
              strInstructions TEXT
            )
          ''');
        debugPrint("db created");
      },
      onOpen: (_) {
        debugPrint("db opened");
      },
      onUpgrade: (_, i, v) {
        debugPrint("db updated $i : $v");
      },
    );
  }

  Future<int> insertData(
      {required tableName, required Map<String, dynamic> data}) async {
    final int result = await _database!.insert(tableName, data);
    return result;
  }

  Future<int> deleteBdId({required tableName, required String id}) async {
    final int result = await _database!
        .delete(tableName, where: "IdDrink = ?", whereArgs: [id]);
    return result;
  }

  Future<int> updateBdId(
      {required tableName,
      required String id,
      required Map<String, dynamic> data}) async {
    final int result = await _database!
        .update(tableName, data, where: "IdDrink = ?", whereArgs: [id]);
    return result;
  }

  Future<List<Map<String, dynamic>>> fetchAll({required tableName}) async {
    final List<Map<String, dynamic>> result = await _database!.query(tableName);
    return result;
  }
}
