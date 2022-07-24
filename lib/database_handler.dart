// Avoid errors caused by flutter upgrade.
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:disk_stash/datatype_music.dart';

Future<Database> databaseConnection() async {
  WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.

  final database = openDatabase(
    join(await getDatabasesPath(), 'cd_database.db'),

    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        // final String isbn;
        // final String title;
        // final Artist artist;
        // final RecordLabel recordLabel;
        // final Type type;
        // final String genera;
        // final int year;
        '''
         CREATE TABLE artist(id INTEGER PRIMARY KEY, name TEXT NOT NULL);
         CREATE TABLE recordLabel(id INTEGER PRIMARY KEY, name TEXT NOT NULL)
         CREATE TABLE album(
            isbn TEXT NOT NULL,
            title TEXT NOT NULL,
            artistID INTEGER NOT NULL,
            recordLabelID INTEGER NOT NULL,
            type TEXT,
            genera TEXT,
            year INTEGER ,
            cover BLOB,
            PRIMARY KEY(isbn, artist, type),
            FOREIGN KEY(artistID) REFERENCES artist(id),
            FOREIGN KEY(recordlabelID) REFERENCES recordLabel(id),
         )
      ''',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  // Set the path to the database. Note: Using the `join` function from the
  // `path` package is best practice to ensure the path is correctly
  // constructed for each platform.
  return database;
}

// Define a function that inserts artists into the database
Future<void> insertArtist(var database, Artist artist) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'artist',
    artist.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// Define a function that inserts recordlabels into the database
Future<void> insertRecordLabel(var database, RecordLabel rl) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'recordLabel',
    rl.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> insertAlbum(var database, Album album) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'album',
    album.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
//TBD - add a function to get all artists from the database 
Future<List<Album>> getAllAlbums(Database db) async {
  
  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('album');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Dog(
      id: maps[i]['id'],
      name: maps[i]['name'],
      age: maps[i]['age'],
    );
  });
}