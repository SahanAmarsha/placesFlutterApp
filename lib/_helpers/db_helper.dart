import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {

  static Future<sql.Database> database() async{
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
        path.join(dbPath, 'places.db'),
        onCreate: (db, version){
          return db.execute(
              "CREATE TABLE user_places( id TEXT PRIMARY KEY, title TEXT, image TEXT)"
          );
        },
        version: 1
    );
  }

  //adding a new place
  static Future<void> insert(String table, Map<String, Object> data) async{

    
    final result = await DBHelper.database();
    result.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  //getting the places
  static Future<List<Map<String, dynamic>>> getData(String table) async
  {
    final result = await DBHelper.database();
    return result.query(table);
  }
}