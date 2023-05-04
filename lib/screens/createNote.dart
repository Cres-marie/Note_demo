import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:notes_demo/colors.dart';
import 'package:notes_demo/constants.dart';
import 'package:notes_demo/models/notesDb.dart';

import '../models/notesModel.dart';
//import 'package:notes_demo/models/notesModel.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  NotesDb dbmanager = new NotesDb();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  NotesModel notesModel = new NotesModel(title: "", description: "", date: "");

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      margin: bmargintop,
      padding: bpadding,
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset('images/backicon.png'),
              ),
              SizedBox(
                width: 240,
              ),
              TextButton(
                  onPressed: () {
                    //_submitNotes(context);
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Processing Data')),
                      // )
                      // ;
                      //                 NotesModel note = NotesModel(
                      //   title: titleController.text.trim(),
                      //   description: descriptionController.text.trim(),
                      //   date: dateController.text.trim(),
                      // );
                      dbmanager.insertdata(notesModel).then((id) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Note saved successfully!')),
                        );
                        // clear the text fields
                        titleController.clear();
                        descriptionController.clear();
                        //dateController.clear();
                      });
                    }
                  },
                  child: Image.asset(
                    'images/button.png',
                    height: 45,
                  ))
            ],
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), hintText: 'Title'),
                  controller: titleController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field cant be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLines: null,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Description'),
                  controller: descriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field cant be empty';
                    }
                    return null;
                  },
                )
              ],
            ),
          ),
        ],
      ),
    )));
  }

//
}
