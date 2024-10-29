import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:convert';

class DatabaseHelper {

  static const String tabkename= 'notes';



  Database ?  _database;




   get database async{
    if(_database !=null){
      print("DB is already opend");
      return _database;
    }
    print("DB is openning ");
    _database = await startDatabase();
    print("DB is  open");
    return _database! ;

  }


  Future<Database?> startDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/notes.db';
    return await openDatabase(path , version: 2 ,
        onCreate: (db,version ) async{
          print("DB is  Created  Table ");
      await db.execute('CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, dec TEXT)');

        } );
  
  }

 

 Future insertNotes (Map<String , dynamic> note) async{
    Database db = await database;
    print(note);
  return  await   db.insert(tabkename, note);
}


Future<List<Map<String, dynamic>>> getAllNotes() async{
  Database db = await database;
  print('get all ');
  return await db.query(tabkename);

}

 Future deleteNote(id) async {
  Database db = await database;
return  await db.delete(tabkename ,where: 'id=?' , whereArgs: [id]);
}


 
}
