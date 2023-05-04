import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notes_demo/models/notesDb.dart';
import 'dart:async';
import 'dart:io';

import '../constants.dart';
import '../models/notesModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  //const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 late NotesDb dbmanager = NotesDb();

  //NotesDb _notesDb = NotesDb();
// List to store notes retrieved from the database
  List<NotesModel> _notes = [];

//initState() method to retrieve the list of notes from the database and update the _notes variable.
  // @override
  void initState() {
    super.initState();
    dbmanager = NotesDb();
    print("init state called.");
    _loadNotes();
  }

  // Method to retrieve the list of notes from the database and update the _notes variable.
  Future<void> _loadNotes() async {
    //print("Opening database connection...");
    // Call the open method to establish the database connection and create the notes table if it does not exist.
    try {
      await dbmanager.open();

      // Call the getdata method to retrieve the list of notes from the database.
      //print("Retrieving notes from the database...");
      List<NotesModel> value = await dbmanager.getdata();
      print("Number of notes retrieved: ${value.length}");
      for (var note in value) {
          print("Note ID: ${note.id}");
          print("Note Title: ${note.title}");
          print("Note Description: ${note.description}");
  
          print("------------------------");
      }


      // Update the _notes variable with the retrieved notes.
      setState(() {
        _notes = value;
      });
      print("Notes loaded successfully.");
    } catch (e) {
      print('Error retrieving : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: bmargintop,
        padding: bpadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notes', style: bheadings),
            SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {},
              child: Image.asset('images/search.png'),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 160,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      'images/notes.png',
                      height: 50,
                    ),
                    label: Text(
                      'All Notes',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 50,
                  width: 160,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      'images/trash.png',
                      height: 50,
                    ),
                    label: Text(
                      'Trash',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Recent Notes',
              style: bheadings,
            ),
            Container(
              height: 200,
              //width: 200,
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
//                 // image: DecorationImage(
//                 //     image: AssetImage('images/splash.png'),
//                 //     alignment: Alignment.center,
//                 //     repeat: ImageRepeat.noRepeat,
//                 //     fit: BoxFit.fill
//                 //   )
              ),
              child: _notes.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: _notes.length,
                      itemBuilder: (context, index) {
                        NotesModel notesModel = _notes[index];
                          print("Note ID: ${notesModel.id}");
                          print("Note Title: ${notesModel.title}");
                          print("Note Description: ${notesModel.description}");
                        
                          return GestureDetector(
                            onLongPress: () async {
                              // delete note from database
                              //await dbmanager.deletedata(notesModel.id);

                              // reload notes list from database and update UI
                              _loadNotes();
                            },

                            //onTap: () => updatedata(notesModel),
                            child: Container(
                              width: 200,
                              child: Card(
                                child: Column(children: [
                                  Text('title: ${notesModel.title}'),
                                  Text(
                                      'description: ${notesModel.description}'),
                                ]),
                              ),
                            ),
                          );
                        
                      },
                    ),
            ),
          ],
        ),
      ),
    )
        //Text('Home'),

        );
  }
}
