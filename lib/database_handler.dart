// Avoid errors caused by flutter upgrade.
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void database_creation() async{
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

}