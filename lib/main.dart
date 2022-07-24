import 'package:disk_stash/database_handler.dart';
import 'package:flutter/material.dart';
import 'package:disk_stash/picture_grid.dart';
import 'package:disk_stash/pop_up_widget.dart';
import 'package:disk_stash/create_album.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiskStash',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: StartUp(),
    );
  }
}

class StartUp extends StatelessWidget {
  const StartUp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Welcome to DiskStash"),
        ),
        body: Container(
          child: Column(children: <Widget>[
            const Text(
                "This is still a development app,\n When you press start database a sqlite file will be opened and the respective tables will be created if they do not exist"),
            ElevatedButton(
                onPressed: () {
                  Future<Database> db = databaseConnection();

                  db.then((value) => { 
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GridPictures(
                                  db: value,
                                )))  
                      });
                },
                child: const Text("Start Database")),
          ]),
        ));
  }
}
