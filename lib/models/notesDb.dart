//import 'package:notes_demo/models/notesModel.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

import 'notesModel.dart';

class NotesDb {
  late Database _database;

//get location of the database

//getDatabasesPath() method is provided by sqflite package in Dart
//and returns the path to the directory where the database files for the app should be stored.
//The path is stored in the databasesPath variable.
//var databasesPath = await getDatabasesPath();
//String path = join(databasesPath, 'notes.db');
// Database database = await openDatabase(path, version: 1,
  // onCreate: (Database db, int version) async {
  // When creating the db, create the table
  // await db.execute(
  // 'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
// });

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await open();
    return _database;
  }

  Future open() async {
    _database = await openDatabase(join(await getDatabasesPath(), 'notesdb.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE notes_table (id INTEGER PRIMARY KEY, title TEXT, description TEXT, date TEXT)",
      );
    });
  }

//inserting into database
  Future<int> insertdata(NotesModel notesModel) async {
    await open();
    //return await _database.insert('notes_table', notesModel.toMap());
    int id = await _database.insert('notes_table', notesModel.toMap());
    print('Inserted note with id: $id');
    return id;
  }

// Retrieving from database
  Future<List<NotesModel>> getdata() async {
    try {
      await open();
      //query to get all notes into a Map list
      final List<Map<String, dynamic>> map =
          await _database.query('notes_table');
      //converting the map list to notes list
      return List.generate(map.length, (i) {
        print('List id:' + map[i]['title'].toString());
        //loop to traverse the list and return notes object
        return NotesModel(
            id: map[i]['id'],
            title: map[i]['title'],
            description: map[i]['description'],
            date: map[i]['date']);
      });
    } catch (e) {
      print("Error in getdata(): $e");
      return [];
    }
  }

  //Update results in table
  Future<int> updatedata(NotesModel notesModel) async {
    await open();
    return await _database.update('notes_table', notesModel.toMap(),
        where: "id = ?", whereArgs: [notesModel.id]);
  }

  //Delete result from the table
  Future<void> deletedata(int id) async {
    await open();
    await _database.delete('notes_table', where: "id = ?", whereArgs: [id]);
  }
}
