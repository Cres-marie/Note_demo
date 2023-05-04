class NotesModel {
  int? id;
  String title;
  String description;
  String? date;

  NotesModel(
      {required this.title, required this.description, date, id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
    };
  }
}


// Container(
//                 height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 3,
//                     blurRadius: 7,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//                 // image: DecorationImage(
//                 //     image: AssetImage('images/splash.png'),
//                 //     alignment: Alignment.center,
//                 //     repeat: ImageRepeat.noRepeat,
//                 //     fit: BoxFit.fill
//                 //   )
//               ),
//                  child: _notes.isEmpty
//                     ? Center(child: CircularProgressIndicator())
//                     : ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemCount: _notes.length,
//                         itemBuilder: (context, index) {
//                           NotesModel notesModel = _notes[index];
//                           return GestureDetector(
//                             onLongPress:() async {
//                                 // delete note from database
//                               //await dbmanager.deletedata(notesModel.id);

//                               // reload notes list from database and update UI
//                               _loadNotes();
//                             },

//                             onTap: () => updatedata(notesModel),
//                             child: Card(
//                               child: Column(
//                                 children: [
//                                   Text('title: ${notesModel.title}'),
//                                   Text('description: ${notesModel.description}'),
//                                 ]
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                ),
