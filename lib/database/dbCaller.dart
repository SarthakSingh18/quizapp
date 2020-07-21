import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dbMapper.dart';

class DbCaller{
  static Database _db;
  static const String questionNumber='questionNumber';
  static const String questionText='questionText';
  static const String table='Question';
  static const String db_name='exployee.db';

  Future<Database> get db async{
    if(_db !=null){
      return db;
    }
    _db=await initDb();
    return _db;
  }

  initDb() async{
    io.Directory documentsDirectory=await getApplicationDocumentsDirectory();
    String path=join(documentsDirectory.path,db_name);
    var db=await openDatabase(path,version: 1,onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db,int version) async {
    print("db created");
    await db.execute("CREATE TABLE $table ($questionNumber String,$questionText String)");
  }

  Future<Null> save(DbMapper dbMapper) async{
    var DB=await db;
    await DB.insert(table, dbMapper.toMap());
    print("now in save");
  }


  Future<List<DbMapper>> get() async{
    var dbClient=await db;
    print("now in get");
    List<Map> maps=await dbClient.query(table,columns:[questionNumber,questionText]);
    List<DbMapper> dbmapper=[];
    if(maps.length>0){
      for(int i=0; i<maps.length;i++){
        dbmapper.add(DbMapper.fromMap(maps[i]));
      }
    }
    return dbmapper;
  }

  Future close() async{
    var dbClient=await db;
    dbClient.close();
  }



}