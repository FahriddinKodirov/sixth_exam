import 'package:flutter/cupertino.dart';
import 'package:six_exam/data/model/card_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static String tableName = 'cards';
  static LocalDatabase getInstance = LocalDatabase.init();

  Database? _database;
  LocalDatabase.init();

  Future<Database> getDb() async {
    if (_database == null) {
      _database = await _initDb('cardsOne.db');
      return _database!;
    }
    return _database!;
  }

  Future<Database> _initDb(String fileName) async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, fileName);

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
        String textType = 'TEXT';
        String intType = 'INTEGER';
        String boolType = 'INTEGER';

        await db.execute('''
        CREATE TABLE $tableName (
          ${UserFields.id} $idType,
          ${UserFields.cardNumber} $textType,
          ${UserFields.cardTime} $textType,
          ${UserFields.cardName} $textType,
          ${UserFields.cardColor} $textType,
          ${UserFields.cardImage} $textType
        )
    ''');
      },
    );
    return database;
  }
//!                         Shu ergacha doim bir hil yoziladi
//___________________________________________________________________________________________//

// -------------------- Malumotni database ga qo'shish ------------------------------------------
  static Future<CardModel> insertCard({required CardModel cardModel}) async {
    var database = await getInstance.getDb();
    int id = await database.insert(tableName, cardModel.toJson());
    debugPrint('ADD BOLDI HAMMASI YAXSHI');
    return cardModel.copyWith(id: id);
  }


// -------------------- Malumotni database dan o'qib olish ------------------------------------------
static Future<List<CardModel>> getCard() async {
    var database = await getInstance.getDb();
    var listOfStudent = await database.query(tableName, columns: [
      UserFields.id,
      UserFields.cardNumber,
      UserFields.cardTime,
      UserFields.cardName,
      UserFields.cardColor,
      UserFields.cardImage,
    ]);
    var list = listOfStudent.map((e) => CardModel.fromJson(e)).toList();
    return list;
  }

// -------------------- Malumotni hammsini database dan o'chirvorish ------------------------------------------
static Future<int> deleteAll() async {
    var database = await getInstance.getDb();
    return await database.delete(tableName);
  }

// -------------------- Malumotni id bilan o'cgirish database dan o'chirvorish ------------------------------------------

  static Future<int> deleteTaskById(int id) async {
    var database = await getInstance.getDb();
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
// -------------------- Malumotni id bilan o'cgirish database dan o'chirvorish ------------------------------------------

static Future<CardModel> updateTaskById(CardModel cardModel) async{
    var database = await getInstance.getDb();
    int id = await database.update(
      tableName, 
      cardModel.toJson(),
      where: 'id = ?',
      whereArgs: [cardModel.id]);
      print('zor');
      return cardModel.copyWith(id: id);
  }

// -------------------- Malumotni search bilan chiqarib berish ------------------------------------------

  // static Future<List<CardModel>> getTaskByTitle({String name = ''}) async{
  //   var database = await getInstance.getDb();

  //   if(name.isNotEmpty){
  //     var listOfTodos = await database.query(
  //       tableName,
  //       where: 'name LIKE ?',
  //       whereArgs: ['%$name%'],);
        
  //       var list = listOfTodos.map((e) => CardModel.fromJson(e)).toList();
  //     return list;
  //   } else {
  //       var listOfTodos = await database.query(tableName, columns: [
  //       UserFields.id,
  //       UserFields.cardNumber,
  //       UserFields.cardTime,
  //       UserFields.cardName,
  //       ]);
  //        var list = listOfTodos.map((e) => CardModel.fromJson(e)).toList();
  //       return list;
  //   }
  // }
  
}
